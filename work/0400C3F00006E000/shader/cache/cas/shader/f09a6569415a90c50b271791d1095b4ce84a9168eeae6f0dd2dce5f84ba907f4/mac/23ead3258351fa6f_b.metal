#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _21* cp_s0 [[id(1)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _37 = as_type<float>(gl_WorkGroupID.x);
    float _39 = as_type<float>(gl_LocalInvocationID.x);
    float _41 = as_type<float>(gl_WorkGroupID.y);
    float _43 = as_type<float>(gl_LocalInvocationID.y);
    int _46 = as_type<int>(_37) * 16;
    int _48 = _46 + as_type<int>(_39);
    bool _52 = _48 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _54 = as_type<int>(_41) * 16;
    int _56 = _54 + as_type<int>(_43);
    if (_52)
    {
        return;
    }
    bool _58 = _56 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    if (_58)
    {
        return;
    }
    bool _60 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
    bool _62 = !_60;
    float _64 = -10000000.0;
    int _66 = -887581056;
    if (!_62)
    {
        int _68 = 0;
        bool _70;
        bool _106;
        do
        {
            float _72 = _64;
            int _74 = _68;
            bool _76 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
            int _78 = _74 + 1;
            bool _80 = _78 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
            bool _82 = !_76;
            _68 = _78;
            float _84 = _72;
            float _86 = _72;
            float _88 = _72;
            if (!_82)
            {
                int _90 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _92 = _90 + 1;
                bool _94 = _92 > 3;
                bool _96 = !_94;
                int _98 = 0;
                int _100 = 0;
                int _102 = -1;
                if (!_96)
                {
                    int _104 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x) + (-3);
                    _102 = 0;
                    do
                    {
                        int _108 = _98;
                        float _110 = _84;
                        int _112 = _108 + 4;
                        float _114 = precise::max(0.0, _110);
                        bool _116 = _112 >= _104;
                        float _118 = precise::max(0.0, _114);
                        float _120 = precise::max(0.0, _118);
                        float _122 = precise::max(0.0, _120);
                        _106 = !_116;
                        _98 = _112;
                        _84 = _122;
                        _100 = _112;
                        _86 = _122;
                    } while (_106);
                }
                int _124 = _100;
                int _126 = _102;
                float _128 = _86;
                int _130 = ~_124;
                int _132 = _130 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _134 = _132 + 1;
                bool _136 = _134 > 1;
                int _138 = _126;
                int _140 = _124;
                float _142 = _128;
                if (_136)
                {
                    _138 = 0;
                }
                int _144 = _138;
                if (_136)
                {
                    int _146 = _124 + 2;
                    _140 = _146;
                }
                int _148 = _140;
                bool _150 = _148 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _152 = (_150 ? (-1) : 0) | _144;
                float _154 = as_type<float>(_148);
                if (_136)
                {
                    float _156 = precise::max(0.0, _128);
                    _154 = _156;
                }
                float _158 = _154;
                if (_136)
                {
                    float _160 = precise::max(0.0, _158);
                    _142 = _160;
                }
                float _162 = _142;
                _88 = _162;
                if (_152 != 0)
                {
                    float _164 = precise::max(0.0, _162);
                    _88 = _164;
                }
            }
            float _166 = _88;
            _70 = !_80;
            _64 = _166;
            _66 = as_type<int>(_166);
        } while (_70);
    }
    int _168 = _66;
    int _170 = _56 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _172 = _170 + _48;
    int _174 = _172 << 2;
    uint _177 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_177)] = uint(_168);
}

