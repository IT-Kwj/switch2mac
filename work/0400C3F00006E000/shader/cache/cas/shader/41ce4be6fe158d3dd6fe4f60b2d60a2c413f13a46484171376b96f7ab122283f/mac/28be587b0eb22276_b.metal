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
    float _64 = 10000000.0;
    float _66 = -10000000.0;
    float _68 = 10000000.0;
    float _70 = -10000000.0;
    if (!_62)
    {
        int _72 = 0;
        bool _74;
        bool _118;
        do
        {
            float _76 = _64;
            int _78 = _72;
            float _80 = _66;
            bool _82 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
            int _84 = _78 + 1;
            bool _86 = _84 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
            bool _88 = !_82;
            _72 = _84;
            float _90 = _80;
            float _92 = _76;
            float _94 = _76;
            float _96 = _80;
            float _98 = _76;
            float _100 = _80;
            if (!_88)
            {
                int _102 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _104 = _102 + 1;
                bool _106 = _104 > 3;
                bool _108 = !_106;
                int _110 = 0;
                int _112 = 0;
                int _114 = -1;
                if (!_108)
                {
                    int _116 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x) + (-3);
                    _114 = 0;
                    do
                    {
                        int _120 = _110;
                        float _122 = _90;
                        float _124 = _92;
                        int _126 = _120 + 4;
                        float _128 = precise::max(0.0, _122);
                        bool _130 = _126 >= _116;
                        float _132 = precise::min(0.0, _124);
                        float _134 = precise::max(0.0, _128);
                        float _136 = precise::min(0.0, _132);
                        float _138 = precise::max(0.0, _134);
                        float _140 = precise::min(0.0, _136);
                        float _142 = precise::max(0.0, _138);
                        float _144 = precise::min(0.0, _140);
                        _118 = !_130;
                        _110 = _126;
                        _90 = _142;
                        _92 = _144;
                        _112 = _126;
                        _94 = _144;
                        _96 = _142;
                    } while (_118);
                }
                int _146 = _112;
                float _148 = _94;
                int _150 = _114;
                float _152 = _96;
                int _154 = ~_146;
                int _156 = _154 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _158 = _156 + 1;
                bool _160 = _158 > 1;
                int _162 = _150;
                int _164 = _146;
                float _166 = as_type<float>(_158);
                float _168 = _148;
                float _170 = _152;
                if (_160)
                {
                    _162 = 0;
                }
                int _172 = _162;
                if (_160)
                {
                    int _174 = _146 + 2;
                    _164 = _174;
                }
                int _176 = _164;
                float _178 = as_type<float>(_176);
                if (_160)
                {
                    float _180 = precise::min(0.0, _148);
                    _166 = _180;
                }
                float _182 = _166;
                if (_160)
                {
                    float _184 = precise::min(0.0, _182);
                    _168 = _184;
                }
                float _186 = _168;
                bool _188 = _176 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _190 = (_188 ? (-1) : 0) | _172;
                _98 = _186;
                if (_160)
                {
                    float _192 = precise::max(0.0, _152);
                    _178 = _192;
                }
                float _194 = _178;
                if (_160)
                {
                    float _196 = precise::max(0.0, _194);
                    _170 = _196;
                }
                float _198 = _170;
                float _200 = _198;
                if (_190 != 0)
                {
                    float _202 = precise::max(0.0, _198);
                    _200 = _202;
                }
                float _204 = _200;
                _100 = _204;
                if (_190 != 0)
                {
                    float _206 = precise::min(0.0, _186);
                    _98 = _206;
                }
            }
            float _208 = _98;
            float _210 = _100;
            _74 = !_86;
            _64 = _208;
            _66 = _210;
            _68 = _208;
            _70 = _210;
        } while (_74);
    }
    float _212 = _68;
    float _214 = _70;
    int _216 = _56 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _218 = _216 + _48;
    float _220 = -_212;
    float _222 = _220 + _214;
    int _224 = _218 << 2;
    uint _227 = uint(int(uint(_224) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_227)] = as_type<uint>(_222);
}

