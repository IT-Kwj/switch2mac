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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _25* cp_s0 [[id(2)]];
    device _25* cp_s1 [[id(3)]];
    device _25* cp_s2 [[id(4)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _45 = as_type<float>(gl_WorkGroupID.x);
    float _47 = as_type<float>(gl_LocalInvocationID.x);
    float _49 = as_type<float>(gl_WorkGroupID.y);
    float _51 = as_type<float>(gl_LocalInvocationID.y);
    int _54 = as_type<int>(_45) * 8;
    int _56 = _54 + as_type<int>(_47);
    bool _60 = uint(_56) > 32u;
    uint _63 = as_type<uint>(_47);
    if (!_60)
    {
        int _65 = as_type<int>(_49) * 8;
        int _67 = _65 + as_type<int>(_51);
        _63 = uint(_67);
    }
    uint _69 = _63;
    bool _71 = _69 > 32u;
    bool _73 = _71 || _60;
    if (_73)
    {
        return;
    }
    int _75 = as_type<int>(_49) * 8;
    int _77 = _56 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].x);
    int _79 = _75 + as_type<int>(_51);
    int _81 = _79 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].y);
    int _83 = _81 | _77;
    bool _85 = _83 >= 0;
    bool _87 = _77 > 32;
    bool _89 = !_85;
    bool _91 = _87 || _89;
    int _93 = _77 * 33;
    int _95 = _93 + _81;
    bool _97 = _81 > 32;
    bool _99 = _97 || _91;
    int _101 = _83;
    int _103 = _81;
    uint _105 = uint(_95);
    if (!_99)
    {
        int _107 = _95 << 3;
        _101 = _107;
    }
    int _109 = _101;
    if (_99)
    {
        _103 = 0;
    }
    int _111 = _103;
    if (_99)
    {
        _105 = 4294967295u;
    }
    uint _113 = _105;
    uint _115 = 0u;
    if (!_99)
    {
        int _117 = _109 + 4;
        _115 = uint(_117);
    }
    uint _119 = _115;
    int _121 = _111;
    if (!_99)
    {
        uint _123 = uint(int(uint(_109) >> uint(2)));
        float _125 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_123)]);
        _121 = as_type<int>(_125);
    }
    int _127 = _121;
    uint _129 = _113;
    if (!_99)
    {
        uint _131 = uint(int(uint(int(_119)) >> uint(2)));
        float _133 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_131)]);
        _129 = as_type<uint>(_133);
    }
    uint _135 = _129;
    bool _137 = 0 < as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _139 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].w));
    float _141 = float(uint(_79));
    float _143 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].z));
    float _145 = float(uint(_56));
    float _147 = fma(_141, 2.0, _139);
    int _149 = _56 * 33;
    int _151 = _149 + _79;
    float _153 = fma(_145, 2.0, _143);
    bool _155 = !_137;
    int _157 = _127;
    uint _159 = _135;
    int _161 = _127;
    int _163 = int(_135);
    if (!_155)
    {
        int _165 = 0;
        int _167 = 0;
        int _169 = 0;
        int _171 = 0;
        int _173 = 0;
        int _175 = 0;
        int _177 = 0;
        bool _179;
        do
        {
            int _181 = _165;
            int _183 = _157;
            int _185 = _167;
            int _187 = _169;
            uint _189 = _159;
            int _191 = _171;
            int _193 = _173;
            int _195 = _175;
            int _197 = _177;
            int _199 = _181 * 48;
            int _201 = _181 + 1;
            int _203 = _199 + 32;
            uint _205 = uint(int(uint(_203) >> uint(2)));
            uint _207 = uint(int(uint(int(_205)) >> uint(2)));
            int _209 = int(_205) & 3;
            float _211 = (*spvDescriptorSet0.cp_c4)._m0[int(_207)][_209];
            bool _213 = _201 >= as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            int _215 = _199 + 40;
            uint _217 = uint(int(uint(_215) >> uint(2)));
            uint _219 = uint(int(uint(int(_217)) >> uint(2)));
            int _221 = int(_217) & 3;
            float _223 = (*spvDescriptorSet0.cp_c4)._m0[int(_219)][_221];
            float _225 = -_153;
            float _227 = _225 + _211;
            float _229 = abs(_227);
            bool _231 = _229 > 6.0;
            bool _233 = isnan(_229);
            bool _235 = _231 || _233;
            bool _237 = isnan(6.0);
            bool _239 = _235 || _237;
            float _241 = -_147;
            float _243 = _241 + _223;
            float _245 = abs(_243);
            bool _247 = _245 <= 6.0;
            bool _249 = !_239;
            bool _251 = _247 && _249;
            _165 = _201;
            int _253 = _185;
            int _255 = _187;
            uint _257 = _189;
            int _259 = _191;
            int _261 = _193;
            int _263 = _195;
            int _265 = _197;
            bool _267 = !_251;
            int _269 = _183;
            if (!_267)
            {
                int _271 = _199 + 48;
                uint _273 = uint(int(uint(_271) >> uint(2)));
                uint _275 = uint(int(uint(int(_273)) >> uint(2)));
                int _277 = int(_273) & 3;
                float _279 = (*spvDescriptorSet0.cp_c4)._m0[int(_275)][_277];
                int _281 = int(_273) + 1;
                uint _283 = uint(int(uint(_281) >> uint(2)));
                int _285 = _281 & 3;
                float _287 = (*spvDescriptorSet0.cp_c4)._m0[int(_283)][_285];
                float _289 = _243 * _243;
                float _291 = float(_189);
                float _293 = fma(_227, _227, _289);
                int _295 = _199 + 56;
                uint _297 = uint(int(uint(_295) >> uint(2)));
                uint _299 = uint(int(uint(int(_297)) >> uint(2)));
                int _301 = int(_297) & 3;
                float _303 = (*spvDescriptorSet0.cp_c4)._m0[int(_299)][_301];
                float _305 = _293 * 10000.0;
                float _307 = trunc(_305);
                float _309 = precise::max(_307, 0.0);
                uint _311 = uint(_309);
                int _313 = _199 + 36;
                uint _315 = uint(int(uint(_313) >> uint(2)));
                uint _317 = uint(int(uint(int(_315)) >> uint(2)));
                int _319 = int(_315) & 3;
                float _321 = (*spvDescriptorSet0.cp_c4)._m0[int(_317)][_319];
                float _323 = 1.0 / _287;
                float _325 = float(_311);
                float _327 = _243 * _303;
                bool _329 = _325 >= _291;
                bool _331 = isnan(_325);
                bool _333 = _329 || _331;
                bool _335 = isnan(_291);
                bool _337 = _333 || _335;
                float _339 = fma(_227, _279, _327);
                bool _341 = !_337;
                uint _343 = uint(_341 ? int(_311) : int(_189));
                float _345 = fma(_339, _323, _321);
                float _347 = _345 * 10000.0;
                int _349 = _183;
                _253 = as_type<int>(_279);
                _255 = as_type<int>(_287);
                _257 = _343;
                _259 = as_type<int>(_303);
                _261 = int(_311);
                _263 = as_type<int>(_321);
                _265 = as_type<int>(_323);
                if (!_337)
                {
                    float _351 = trunc(_347);
                    float _353 = precise::max(_351, 0.0);
                    uint _355 = uint(_353);
                    _349 = int(_355);
                }
                int _357 = _349;
                _269 = _357;
            }
            int _359 = _269;
            int _361 = _253;
            int _363 = _255;
            uint _365 = _257;
            int _367 = _259;
            int _369 = _261;
            int _371 = _263;
            int _373 = _265;
            _179 = !_213;
            _157 = _359;
            _167 = _361;
            _169 = _363;
            _159 = _365;
            _171 = _367;
            _173 = _369;
            _175 = _371;
            _177 = _373;
            _161 = _359;
            _163 = int(_365);
        } while (_179);
    }
    int _375 = _161;
    int _377 = _163;
    int _379 = -as_type<int>(_51);
    int _381 = _151 << 3;
    bool _383 = _75 != _379;
    uint _385 = uint(int(uint(_381) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_385)] = uint(_375);
    int _387 = _381 + 4;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_389)] = uint(_377);
    if (_383)
    {
        return;
    }
    int _391 = _56 << 2;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_393)] = 0u;
}

