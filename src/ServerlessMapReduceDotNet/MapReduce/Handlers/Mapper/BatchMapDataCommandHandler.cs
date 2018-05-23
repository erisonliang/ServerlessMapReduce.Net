﻿using System;
using System.Threading.Tasks;
using AzureFromTheTrenches.Commanding.Abstractions;
using ServerlessMapReduceDotNet.MapReduce.Abstractions;
using ServerlessMapReduceDotNet.MapReduce.Commands.Map;
using ServerlessMapReduceDotNet.Model;
using ServerlessMapReduceDotNet.ServerlessInfrastructure.Abstractions;

namespace ServerlessMapReduceDotNet.MapReduce.Handlers.Mapper
{
    public class BatchMapDataCommandHandler : ICommandHandler<BatchMapDataCommand>
    {
        private readonly IConfig _config;
        private readonly IServiceProvider _serviceProvider;
        private readonly ICommandDispatcher _commandDispatcher;

        public BatchMapDataCommandHandler(IConfig config, IServiceProvider serviceProvider, ICommandDispatcher commandDispatcher)
        {
            _config = config;
            _serviceProvider = serviceProvider;
            _commandDispatcher = commandDispatcher;
        }
        
        public async Task ExecuteAsync(BatchMapDataCommand command)
        {
            var mapperFunc = (IMapperFunc)_serviceProvider.GetService(_config.MapperFuncType);
            
            var keyValuePairCollection = new KeyValuePairCollection();

            foreach (var line in command.Lines)
            {
                keyValuePairCollection.AddRange(mapperFunc.Map(line));
            }

            await _commandDispatcher.DispatchAsync(new WriteMappedDataCommand
            {
                ContextQueueMessage = command.ContextQueueMessage,
                ResultOfMap = keyValuePairCollection
            });
        }
    }
}