#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c1 [[id(0)]];
    constant _16* cp_c0 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c7 [[id(3)]];
    constant _16* cp_c5 [[id(4)]];
    constant _16* cp_c3 [[id(5)]];
    constant _16* cp_c4 [[id(6)]];
    device _33* cp_s0 [[id(7)]];
    device _33* cp_s1 [[id(8)]];
    device _33* cp_s2 [[id(9)]];
    device _33* cp_s3 [[id(10)]];
    texture2d<float> cp_t_tcb_8 [[id(11)]];
    sampler cp_t_tcb_8Smplr [[id(12)]];
    texture2d<float> cp_t_tcb_A [[id(13)]];
    sampler cp_t_tcb_ASmplr [[id(14)]];
    texture2d_array<float> cp_t_tcb_E [[id(15)]];
    sampler cp_t_tcb_ESmplr [[id(16)]];
    texture2d_array<float> cp_t_tcb_10 [[id(17)]];
    sampler cp_t_tcb_10Smplr [[id(18)]];
    texture2d_array<float> cp_t_tcb_12 [[id(19)]];
    sampler cp_t_tcb_12Smplr [[id(20)]];
    texture2d_array<float> cp_t_tcb_C [[id(21)]];
    sampler cp_t_tcb_CSmplr [[id(22)]];
    sampler cp_t_tcb_8Smplr_w [[id(23)]];
    sampler cp_t_tcb_ASmplr_w [[id(24)]];
    sampler cp_t_tcb_ESmplr_w [[id(25)]];
    sampler cp_t_tcb_10Smplr_w [[id(26)]];
    sampler cp_t_tcb_12Smplr_w [[id(27)]];
    sampler cp_t_tcb_CSmplr_w [[id(28)]];
    constant dm_border_t* dm_border [[id(29)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _111 = false;
    bool _975 = false;
    bool _905 = false;
    bool _903 = false;
    bool _491 = false;
    bool _421 = false;
    bool _419 = false;
    bool _109 = false;
    float _73 = as_type<float>(gl_WorkGroupID.x);
    float _75 = as_type<float>(gl_LocalInvocationID.x);
    int _78 = as_type<int>(_73) * 64;
    int _80 = _78 + as_type<int>(_75);
    bool _84 = uint(_80) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_84)
    {
        return;
    }
    int _86 = _80 << 2;
    uint _89 = uint(int(uint(_86) >> uint(2)));
    float _91 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_89)]);
    uint _93 = min(as_type<uint>(_91), 2u);
    int _95 = int(_93) * 4;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    uint _99 = uint(int(uint(int(_97)) >> uint(2)));
    int _101 = int(_97) & 3;
    float _103 = (*spvDescriptorSet0.cp_c1)._m0[int(_99)][_101];
    bool _105 = as_type<int>(_103) == 224;
    if (!_105)
    {
        bool _107 = as_type<int>(_103) == 304;
        _109 = _107;
        if (!_109)
        {
            _111 = true;
        }
    }
    if ((!_111) || _109)
    {
        int _113;
        int _115;
        int _117;
        int _119;
        int _121;
        int _123;
        int _125;
        int _127;
        if (!_109)
        {
            _113 = 0;
            _115 = 0;
            _117 = 0;
            _119 = 0;
            _121 = 0;
            _123 = 0;
            _125 = 0;
            _127 = 0;
        }
        if (false || _109)
        {
            _109 = false;
            int _129 = _80 * 32;
            int _131 = _129 + 16;
            uint _133 = uint(int(uint(_129) >> uint(2)));
            float _135 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_133)]);
            int _137 = _129 + 8;
            uint _139 = uint(int(uint(_137) >> uint(2)));
            float _141 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_139)]);
            int _143 = _129 + 12;
            uint _145 = uint(int(uint(_143) >> uint(2)));
            float _147 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_145)]);
            uint _149 = uint(int(uint(_131) >> uint(2)));
            float _151 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_149)]);
            int _153 = _131 + 8;
            uint _155 = uint(int(uint(_153) >> uint(2)));
            float _157 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_155)]);
            int _159 = _131 + 12;
            uint _161 = uint(int(uint(_159) >> uint(2)));
            float _163 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_161)]);
            float _165 = fma(_135, 6.2500002968590706586837768554688e-05, 0.5);
            float _167 = fma(_141, 6.2500002968590706586837768554688e-05, 0.5);
            float _169 = fma(_151, 6.2500002968590706586837768554688e-05, 0.5);
            float _171 = fma(_157, 6.2500002968590706586837768554688e-05, 0.5);
            float2 _1428 = float2(_165, _167);
            float _173 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1428, float2(0.0), isnan(_1428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1428, float2(0.0), isnan(_1428)), level(0.0)).x;
            float2 _1439 = float2(_169, _171);
            float _175 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1439, float2(0.0), isnan(_1439)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1439, float2(0.0), isnan(_1439)), level(0.0)).x;
            float _177 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[64]);
            float _179 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[65]);
            float2 _1454 = float2(_165, _167);
            float _181 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1454, float2(0.0), isnan(_1454)), level(_173)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1454, float2(0.0), isnan(_1454)), level(_173)).y;
            float2 _1463 = float2(_169, _171);
            float _183 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1463, float2(0.0), isnan(_1463)), level(_175)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1463, float2(0.0), isnan(_1463)), level(_175)).y;
            int _185 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 1;
            bool _187 = _185 != 0;
            int _189 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 2;
            bool _191 = _189 != 0;
            int _193 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 4;
            bool _195 = _193 != 0;
            int _197 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 8;
            bool _199 = _197 != 0;
            float _201 = 0.0;
            float _203 = _165;
            float _205 = _167;
            float _207 = _169;
            int _209 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            bool _211 = _187;
            int _213 = _195 ? (-1) : 0;
            _113 = as_type<int>(_135);
            _117 = as_type<int>(_141);
            _119 = as_type<int>(_147);
            _121 = as_type<int>(_151);
            _125 = as_type<int>(_157);
            _127 = as_type<int>(_163);
            if (_187)
            {
                float _215 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
                float _217 = _135 + _215;
                _201 = _217;
            }
            float _219 = _201;
            float _221 = 0.0;
            float _223 = _219;
            if (_187)
            {
                float _225 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
                float _227 = _141 + _225;
                _221 = _227;
            }
            float _229 = _221;
            float _231 = 0.0;
            float _233 = _229;
            if (_191)
            {
                float _235 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
                float _237 = _135 + _235;
                _231 = _237;
            }
            float _239 = _231;
            float _241 = 0.0;
            int _243 = as_type<int>(_239);
            if (_191)
            {
                float _245 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
                float _247 = _141 + _245;
                _241 = _247;
            }
            float _249 = _241;
            float _251 = _249;
            if (_187)
            {
                float _253 = abs(_219);
                float _255 = abs(_229);
                float _257 = precise::max(_253, _255);
                _233 = _257;
            }
            float _259 = _233;
            if (!_187)
            {
                _223 = 10000.0;
            }
            float _261 = _223;
            float _263 = _261;
            if (_191)
            {
                float _265 = abs(_239);
                float _267 = abs(_249);
                float _269 = precise::max(_265, _267);
                _251 = _269;
            }
            float _271 = _251;
            float _273 = _271;
            if (_187)
            {
                float _275 = precise::min(_259, 10000.0);
                _263 = _275;
            }
            float _277 = _263;
            float _279 = _277;
            if (_195)
            {
                float _281 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
                float _283 = _135 + _281;
                _203 = _283;
            }
            float _285 = _203;
            float _287 = _285;
            if (_195)
            {
                float _289 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
                float _291 = _141 + _289;
                _205 = _291;
            }
            float _293 = _205;
            float _295 = _293;
            if (_199)
            {
                float _297 = -_179;
                float _299 = _141 + _297;
                _207 = _299;
            }
            float _301 = _207;
            bool _303 = false;
            float _305 = _301;
            if (_191)
            {
                bool _307 = _277 > _271;
                _303 = _307;
            }
            bool _309 = _303;
            int _311 = _309 ? (-1) : 0;
            if (!_191)
            {
                _243 = 0;
            }
            int _313 = _243;
            int _315 = _313;
            if (_195)
            {
                float _317 = abs(_285);
                float _319 = abs(_293);
                float _321 = precise::max(_317, _319);
                _287 = _321;
            }
            float _323 = _287;
            if (_199)
            {
                float _325 = -_177;
                float _327 = _135 + _325;
                _295 = _327;
            }
            float _329 = _295;
            if (_191)
            {
                float _331 = _309 ? _271 : _277;
                _279 = _331;
            }
            float _333 = _279;
            float _335 = _333;
            if (_191)
            {
                bool _337 = !_309;
                int _339 = _337 ? 0 : 1;
                _315 = _339;
            }
            int _341 = _315;
            bool _343 = false;
            int _345 = _341;
            if (_195)
            {
                bool _347 = _333 > _323;
                _343 = _347;
            }
            bool _349 = _343;
            if (_199)
            {
                float _351 = abs(_329);
                float _353 = abs(_301);
                float _355 = precise::max(_351, _353);
                _305 = _355;
            }
            float _357 = _305;
            if (_195)
            {
                float _359 = _349 ? _323 : _333;
                _335 = _359;
            }
            float _361 = _335;
            if (_195)
            {
                bool _363 = !_349;
                int _365 = _363 ? _341 : 2;
                _345 = _365;
            }
            int _367 = _345;
            int _369 = _367;
            if (_199)
            {
                bool _371 = _361 > _357;
                _311 = _371 ? (-1) : 0;
            }
            int _373 = _311;
            if (_199)
            {
                int _375 = ~_373;
                int _377 = (_375 != 0) ? _367 : 3;
                _369 = _377;
            }
            int _379 = _369;
            int _381 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z) << 4;
            bool _383 = _379 != 0;
            bool _385 = !_383;
            float _387 = as_type<float>(_379);
            bool _389 = _383;
            float _413;
            float _415;
            float _489;
            if (!_385)
            {
                int _391 = _379 + (-1);
                uint _393 = min(uint(_391), 3u);
                int _395 = int(_393) * 4;
                int _397 = _395 + 12;
                uint _399 = uint(int(uint(_397) >> uint(2)));
                uint _401 = uint(int(uint(int(_399)) >> uint(2)));
                int _403 = int(_399) & 3;
                float _405 = (*spvDescriptorSet0.cp_c1)._m0[int(_401)][_403];
                int _407 = as_type<int>(_405) >> 31;
                bool _409 = as_type<int>(_405) == 1264;
                float _411 = _405;
                _413 = as_type<float>(_407);
                _415 = as_type<float>(_395);
                if (!_409)
                {
                    bool _417 = as_type<int>(_405) == 1584;
                    _419 = _417;
                    if (!_419)
                    {
                        _421 = true;
                    }
                }
                if (!_419)
                {
                    if (!_421)
                    {
                        float _423 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
                        float _425 = _135 + _423;
                        int _427 = as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z) << 4;
                        float _429 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
                        float _431 = _141 + _429;
                        float _433 = abs(_425);
                        float _435 = abs(_431);
                        float _437 = precise::max(_433, _435);
                        uint _439 = uint(int(uint(_427) >> uint(2)));
                        uint _441 = uint(int(uint(int(_439)) >> uint(2)));
                        int _443 = int(_439) & 3;
                        float _445 = (*spvDescriptorSet0.cp_c6)._m0[int(_441)][_443];
                        float _447 = _437 * _445;
                        float _449 = _447 * 4.0;
                        float _451 = precise::max(_449, 1.0);
                        float _453 = log2(_451);
                        float _455 = precise::min(_453, 5.0);
                        float _457 = floor(_455);
                        int _459 = int(_457);
                        float _461 = floor(_455);
                        int _463 = _459 + as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z);
                        int _465 = _463 * 16;
                        float _467 = rint(_461);
                        float _469 = precise::max(_467, 0.0);
                        uint _471 = uint(_469);
                        uint _473 = clamp(_471, 0u, 65535u);
                        uint _475 = uint(int(uint(_465) >> uint(2)));
                        uint _477 = uint(int(uint(int(_475)) >> uint(2)));
                        int _479 = int(_475) & 3;
                        float _481 = (*spvDescriptorSet0.cp_c6)._m0[int(_477)][_479];
                        float _483 = fma(_481, _431, 0.5);
                        float _485 = fma(_481, _425, 0.5);
                        float3 _1933 = float3(_485, _483, float(int(_473)));
                        float3 _1937 = select(_1933, float3(0.0), isnan(_1933));
                        float _487 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _1937.xy, uint(rint(_1937.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _1937.xy, uint(rint(_1937.z)), level(0.0)).y;
                        _413 = _453;
                        _415 = _455;
                        _387 = _461;
                        _273 = as_type<float>(_473);
                        _209 = as_type<int>(_481);
                        _489 = _487;
                        _491 = true;
                    }
                }
                if (((!_491) || _421) || _419)
                {
                    if ((!_421) || _419)
                    {
                        _419 = false;
                        float _493 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
                        float _495 = _135 + _493;
                        int _497 = as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z) << 4;
                        float _499 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
                        float _501 = _141 + _499;
                        float _503 = abs(_495);
                        float _505 = abs(_501);
                        float _507 = precise::max(_503, _505);
                        uint _509 = uint(int(uint(_497) >> uint(2)));
                        uint _511 = uint(int(uint(int(_509)) >> uint(2)));
                        int _513 = int(_509) & 3;
                        float _515 = (*spvDescriptorSet0.cp_c7)._m0[int(_511)][_513];
                        float _517 = _507 * _515;
                        float _519 = _517 * 4.0;
                        float _521 = precise::max(_519, 1.0);
                        float _523 = log2(_521);
                        float _525 = precise::min(_523, 5.0);
                        float _527 = floor(_525);
                        int _529 = int(_527);
                        float _531 = floor(_525);
                        int _533 = _529 + as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z);
                        int _535 = _533 << 4;
                        float _537 = rint(_531);
                        float _539 = precise::max(_537, 0.0);
                        uint _541 = uint(_539);
                        uint _543 = clamp(_541, 0u, 65535u);
                        uint _545 = uint(int(uint(_535) >> uint(2)));
                        uint _547 = uint(int(uint(int(_545)) >> uint(2)));
                        int _549 = int(_545) & 3;
                        float _551 = (*spvDescriptorSet0.cp_c7)._m0[int(_547)][_549];
                        float _553 = fma(_551, _501, 0.5);
                        float _555 = fma(_551, _495, 0.5);
                        float3 _2059 = float3(_555, _553, float(int(_543)));
                        float3 _2061 = select(_2059, float3(0.0), isnan(_2059));
                        float _557 = dm_bs(spvDescriptorSet0.cp_t_tcb_10.sample(spvDescriptorSet0.cp_t_tcb_10Smplr, _2061.xy, uint(rint(_2061.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_10, spvDescriptorSet0.cp_t_tcb_10Smplr_w, _2061.xy, uint(rint(_2061.z)), level(0.0)).y;
                        _413 = _523;
                        _415 = _525;
                        _387 = _531;
                        _273 = as_type<float>(_543);
                        _209 = as_type<int>(_551);
                        _489 = _557;
                        _491 = true;
                    }
                    if ((!_491) || _421)
                    {
                        _421 = false;
                        bool _559 = _379 != 3;
                        _389 = _559;
                        if (_559)
                        {
                            _411 = 0.0;
                        }
                        float _561 = _411;
                        _489 = _561;
                        _491 = _559;
                        if (!_491)
                        {
                            float _563 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[66]);
                            int _565 = as_type<int>(_563) << 4;
                            uint _567 = uint(int(uint(_565) >> uint(2)));
                            float _569 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_567)]);
                            float _571 = -_177;
                            float _573 = _135 + _571;
                            float _575 = -_179;
                            float _577 = _141 + _575;
                            float _579 = abs(_573);
                            float _581 = abs(_577);
                            float _583 = precise::max(_579, _581);
                            float _585 = _569 * _583;
                            float _587 = _585 * 4.0;
                            float _589 = precise::max(_587, 1.0);
                            float _591 = log2(_589);
                            float _593 = precise::min(_591, 5.0);
                            float _595 = floor(_593);
                            int _597 = int(_595);
                            int _599 = as_type<int>(_563) + _597;
                            int _601 = _599 << 4;
                            int _603 = _601 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[38].x);
                            bool _605 = uint(_603) < uint(_601);
                            int _607 = int(_605);
                            int _609 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[38].y) + _607;
                            uint _611 = uint(int(uint(_601) >> uint(2)));
                            float _613 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_611)]);
                            float _615 = floor(_593);
                            float _617 = rint(_615);
                            float _619 = precise::max(_617, 0.0);
                            uint _621 = uint(_619);
                            uint _623 = clamp(_621, 0u, 65535u);
                            float _625 = fma(_613, _577, 0.5);
                            float _627 = fma(_613, _573, 0.5);
                            float3 _2191 = float3(_627, _625, float(int(_623)));
                            float3 _2193 = select(_2191, float3(0.0), isnan(_2191));
                            float _629 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2193.xy, uint(rint(_2193.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2193.xy, uint(rint(_2193.z)), level(0.0)).y;
                            _413 = _615;
                            _415 = _613;
                            _387 = as_type<float>(_609);
                            _273 = _593;
                            _389 = _605;
                            _209 = as_type<int>(_591);
                            _489 = _629;
                            _491 = true;
                        }
                    }
                }
            }
            else
            {
                uint _631 = uint(int(uint(_381) >> uint(2)));
                uint _633 = uint(int(uint(int(_631)) >> uint(2)));
                int _635 = int(_631) & 3;
                float _637 = (*spvDescriptorSet0.cp_c5)._m0[int(_633)][_635];
                float _639 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
                float _641 = _135 + _639;
                float _643 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
                float _645 = _141 + _643;
                float _647 = abs(_641);
                float _649 = abs(_645);
                float _651 = precise::max(_647, _649);
                float _653 = _637 * _651;
                float _655 = _653 * 4.0;
                float _657 = precise::max(_655, 1.0);
                float _659 = log2(_657);
                float _661 = precise::min(_659, 5.0);
                float _663 = floor(_661);
                int _665 = int(_663);
                float _667 = floor(_661);
                int _669 = _665 + as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z);
                int _671 = _669 * 16;
                float _673 = rint(_667);
                float _675 = precise::max(_673, 0.0);
                uint _677 = uint(_675);
                uint _679 = clamp(_677, 0u, 65535u);
                uint _681 = uint(int(uint(_671) >> uint(2)));
                uint _683 = uint(int(uint(int(_681)) >> uint(2)));
                int _685 = int(_681) & 3;
                float _687 = (*spvDescriptorSet0.cp_c5)._m0[int(_683)][_685];
                float _689 = fma(_687, _645, 0.5);
                float _691 = fma(_687, _641, 0.5);
                float3 _2302 = float3(_691, _689, float(int(_679)));
                float3 _2304 = select(_2302, float3(0.0), isnan(_2302));
                float _693 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2304.xy, uint(rint(_2304.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2304.xy, uint(rint(_2304.z)), level(0.0)).y;
                _413 = _659;
                _415 = _661;
                _387 = _667;
                _273 = as_type<float>(_679);
                _209 = as_type<int>(_687);
                _489 = _693;
            }
            _491 = false;
            float _695 = _413;
            float _697 = _415;
            float _699 = _387;
            float _701 = _273;
            bool _703 = _389;
            int _705 = _209;
            float _707 = _489;
            float _709 = _695;
            float _711 = _697;
            float _713 = _699;
            float _715 = _701;
            int _717 = _705;
            bool _719 = _703;
            if (_187)
            {
                float _721 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
                float _723 = _151 + _721;
                _709 = _723;
            }
            float _725 = _709;
            float _727 = _725;
            if (_187)
            {
                float _729 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
                float _731 = _157 + _729;
                _711 = _731;
            }
            float _733 = _711;
            float _735 = _733;
            if (_191)
            {
                float _737 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
                float _739 = _151 + _737;
                _713 = _739;
            }
            float _741 = _713;
            float _743 = _741;
            if (_191)
            {
                float _745 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
                float _747 = _157 + _745;
                _715 = _747;
            }
            float _749 = _715;
            float _751 = _749;
            if (!_191)
            {
                _717 = 0;
            }
            int _753 = _717;
            int _755 = _753;
            if (_187)
            {
                float _757 = abs(_725);
                float _759 = abs(_733);
                float _761 = precise::max(_757, _759);
                _735 = _761;
            }
            float _763 = _735;
            float _765 = _763;
            if (!_187)
            {
                _727 = 10000.0;
            }
            float _767 = _727;
            float _769 = _767;
            if (_191)
            {
                float _771 = abs(_741);
                float _773 = abs(_749);
                float _775 = precise::max(_771, _773);
                _751 = _775;
            }
            float _777 = _751;
            float _779 = _777;
            if (_195)
            {
                float _781 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
                float _783 = _157 + _781;
                _743 = _783;
            }
            float _785 = _743;
            float _787 = _785;
            if (_187)
            {
                float _789 = precise::min(_763, 10000.0);
                _769 = _789;
            }
            float _791 = _769;
            float _793 = _791;
            if (_195)
            {
                float _795 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
                float _797 = _151 + _795;
                _765 = _797;
            }
            float _799 = _765;
            float _801 = _799;
            if (_191)
            {
                bool _803 = _791 > _777;
                _211 = _803;
            }
            bool _805 = _211;
            if (_195)
            {
                float _807 = abs(_799);
                float _809 = abs(_785);
                float _811 = precise::max(_807, _809);
                _801 = _811;
            }
            float _813 = _801;
            if (_199)
            {
                float _815 = -_177;
                float _817 = _151 + _815;
                _787 = _817;
            }
            float _819 = _787;
            if (_191)
            {
                float _821 = _805 ? _777 : _791;
                _793 = _821;
            }
            float _823 = _793;
            float _825 = _823;
            if (_199)
            {
                float _827 = -_179;
                float _829 = _157 + _827;
                _779 = _829;
            }
            float _831 = _779;
            float _833 = _831;
            if (_191)
            {
                bool _835 = !_805;
                int _837 = _835 ? 0 : 1;
                _755 = _837;
            }
            int _839 = _755;
            int _841 = _839;
            if (_195)
            {
                bool _843 = _823 > _813;
                _719 = _843;
            }
            bool _845 = _719;
            if (_199)
            {
                float _847 = abs(_819);
                float _849 = abs(_831);
                float _851 = precise::max(_847, _849);
                _833 = _851;
            }
            float _853 = _833;
            if (_195)
            {
                float _855 = _845 ? _813 : _823;
                _825 = _855;
            }
            float _857 = _825;
            if (_195)
            {
                bool _859 = !_845;
                int _861 = _859 ? _839 : 2;
                _841 = _861;
            }
            int _863 = _841;
            int _865 = _863;
            if (_199)
            {
                bool _867 = _857 > _853;
                _213 = _867 ? (-1) : 0;
            }
            int _869 = _213;
            if (_199)
            {
                int _871 = ~_869;
                int _873 = (_871 != 0) ? _863 : 3;
                _865 = _873;
            }
            int _875 = _865;
            bool _877 = _875 != 0;
            bool _879 = !_877;
            float _973;
            if (!_879)
            {
                int _881 = _875 + (-1);
                uint _883 = min(uint(_881), 3u);
                int _885 = int(_883) * 4;
                int _887 = _885 + 28;
                uint _889 = uint(int(uint(_887) >> uint(2)));
                uint _891 = uint(int(uint(int(_889)) >> uint(2)));
                int _893 = int(_889) & 3;
                float _895 = (*spvDescriptorSet0.cp_c1)._m0[int(_891)][_893];
                bool _897 = as_type<int>(_895) == 3104;
                float _899 = as_type<float>(_885);
                if (!_897)
                {
                    bool _901 = as_type<int>(_895) == 3424;
                    _903 = _901;
                    if (!_903)
                    {
                        _905 = true;
                    }
                }
                if (!_903)
                {
                    if (!_905)
                    {
                        float _907 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
                        float _909 = _151 + _907;
                        int _911 = as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z) << 4;
                        float _913 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
                        float _915 = _157 + _913;
                        float _917 = abs(_909);
                        float _919 = abs(_915);
                        float _921 = precise::max(_917, _919);
                        uint _923 = uint(int(uint(_911) >> uint(2)));
                        uint _925 = uint(int(uint(int(_923)) >> uint(2)));
                        int _927 = int(_923) & 3;
                        float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
                        float _931 = _921 * _929;
                        float _933 = _931 * 4.0;
                        float _935 = precise::max(_933, 1.0);
                        float _937 = log2(_935);
                        float _939 = precise::min(_937, 5.0);
                        float _941 = floor(_939);
                        int _943 = int(_941);
                        float _945 = floor(_939);
                        int _947 = _943 + as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z);
                        int _949 = _947 * 16;
                        float _951 = rint(_945);
                        float _953 = precise::max(_951, 0.0);
                        uint _955 = uint(_953);
                        uint _957 = clamp(_955, 0u, 65535u);
                        uint _959 = uint(int(uint(_949) >> uint(2)));
                        uint _961 = uint(int(uint(int(_959)) >> uint(2)));
                        int _963 = int(_959) & 3;
                        float _965 = (*spvDescriptorSet0.cp_c6)._m0[int(_961)][_963];
                        float _967 = fma(_965, _915, 0.5);
                        float _969 = fma(_965, _909, 0.5);
                        float3 _2723 = float3(_969, _967, float(int(_957)));
                        float3 _2725 = select(_2723, float3(0.0), isnan(_2723));
                        float _971 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _2725.xy, uint(rint(_2725.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _2725.xy, uint(rint(_2725.z)), level(0.0)).y;
                        _973 = _971;
                        _975 = true;
                    }
                }
                if (((!_975) || _905) || _903)
                {
                    if ((!_905) || _903)
                    {
                        _903 = false;
                        float _977 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
                        float _979 = _151 + _977;
                        int _981 = as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z) << 4;
                        float _983 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
                        float _985 = _157 + _983;
                        float _987 = abs(_979);
                        float _989 = abs(_985);
                        float _991 = precise::max(_987, _989);
                        uint _993 = uint(int(uint(_981) >> uint(2)));
                        uint _995 = uint(int(uint(int(_993)) >> uint(2)));
                        int _997 = int(_993) & 3;
                        float _999 = (*spvDescriptorSet0.cp_c7)._m0[int(_995)][_997];
                        float _1001 = _991 * _999;
                        float _1003 = _1001 * 4.0;
                        float _1005 = precise::max(_1003, 1.0);
                        float _1007 = log2(_1005);
                        float _1009 = precise::min(_1007, 5.0);
                        float _1011 = floor(_1009);
                        int _1013 = int(_1011);
                        float _1015 = floor(_1009);
                        int _1017 = _1013 + as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z);
                        int _1019 = _1017 * 16;
                        float _1021 = rint(_1015);
                        float _1023 = precise::max(_1021, 0.0);
                        uint _1025 = uint(_1023);
                        uint _1027 = clamp(_1025, 0u, 65535u);
                        uint _1029 = uint(int(uint(_1019) >> uint(2)));
                        uint _1031 = uint(int(uint(int(_1029)) >> uint(2)));
                        int _1033 = int(_1029) & 3;
                        float _1035 = (*spvDescriptorSet0.cp_c7)._m0[int(_1031)][_1033];
                        float _1037 = fma(_1035, _985, 0.5);
                        float _1039 = fma(_1035, _979, 0.5);
                        float3 _2840 = float3(_1039, _1037, float(int(_1027)));
                        float3 _2842 = select(_2840, float3(0.0), isnan(_2840));
                        float _1041 = dm_bs(spvDescriptorSet0.cp_t_tcb_10.sample(spvDescriptorSet0.cp_t_tcb_10Smplr, _2842.xy, uint(rint(_2842.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_10, spvDescriptorSet0.cp_t_tcb_10Smplr_w, _2842.xy, uint(rint(_2842.z)), level(0.0)).y;
                        _973 = _1041;
                        _975 = true;
                    }
                    if ((!_975) || _905)
                    {
                        _905 = false;
                        bool _1043 = _875 != 3;
                        if (_1043)
                        {
                            _899 = 0.0;
                        }
                        float _1045 = _899;
                        _973 = _1045;
                        _975 = _1043;
                        if (!_975)
                        {
                            float _1047 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[66]);
                            int _1049 = as_type<int>(_1047) << 4;
                            uint _1051 = uint(int(uint(_1049) >> uint(2)));
                            float _1053 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1051)]);
                            float _1055 = -_177;
                            float _1057 = _151 + _1055;
                            float _1059 = -_179;
                            float _1061 = _157 + _1059;
                            float _1063 = abs(_1057);
                            float _1065 = abs(_1061);
                            float _1067 = precise::max(_1063, _1065);
                            float _1069 = _1053 * _1067;
                            float _1071 = _1069 * 4.0;
                            float _1073 = precise::max(_1071, 1.0);
                            float _1075 = log2(_1073);
                            float _1077 = precise::min(_1075, 5.0);
                            float _1079 = floor(_1077);
                            int _1081 = int(_1079);
                            int _1083 = as_type<int>(_1047) + _1081;
                            int _1085 = _1083 << 4;
                            uint _1087 = uint(int(uint(_1085) >> uint(2)));
                            float _1089 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1087)]);
                            float _1091 = floor(_1077);
                            float _1093 = rint(_1091);
                            float _1095 = precise::max(_1093, 0.0);
                            uint _1097 = uint(_1095);
                            uint _1099 = clamp(_1097, 0u, 65535u);
                            float _1101 = fma(_1089, _1061, 0.5);
                            float _1103 = fma(_1089, _1057, 0.5);
                            float3 _2945 = float3(_1103, _1101, float(int(_1099)));
                            float3 _2947 = select(_2945, float3(0.0), isnan(_2945));
                            float _1105 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2947.xy, uint(rint(_2947.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2947.xy, uint(rint(_2947.z)), level(0.0)).y;
                            _973 = _1105;
                            _975 = true;
                        }
                    }
                }
            }
            else
            {
                uint _1107 = uint(int(uint(_381) >> uint(2)));
                uint _1109 = uint(int(uint(int(_1107)) >> uint(2)));
                int _1111 = int(_1107) & 3;
                float _1113 = (*spvDescriptorSet0.cp_c5)._m0[int(_1109)][_1111];
                float _1115 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
                float _1117 = _151 + _1115;
                float _1119 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
                float _1121 = _157 + _1119;
                float _1123 = abs(_1117);
                float _1125 = abs(_1121);
                float _1127 = precise::max(_1123, _1125);
                float _1129 = _1113 * _1127;
                float _1131 = _1129 * 4.0;
                float _1133 = precise::max(_1131, 1.0);
                float _1135 = log2(_1133);
                float _1137 = precise::min(_1135, 5.0);
                float _1139 = floor(_1137);
                int _1141 = int(_1139);
                int _1143 = _1141 + as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z);
                int _1145 = _1143 * 16;
                float _1147 = floor(_1137);
                uint _1149 = uint(int(uint(_1145) >> uint(2)));
                uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
                int _1153 = int(_1149) & 3;
                float _1155 = (*spvDescriptorSet0.cp_c5)._m0[int(_1151)][_1153];
                float _1157 = rint(_1147);
                float _1159 = precise::max(_1157, 0.0);
                uint _1161 = uint(_1159);
                uint _1163 = clamp(_1161, 0u, 65535u);
                float _1165 = fma(_1155, _1121, 0.5);
                float _1167 = fma(_1155, _1117, 0.5);
                float3 _3048 = float3(_1167, _1165, float(int(_1163)));
                float3 _3050 = select(_3048, float3(0.0), isnan(_3048));
                float _1169 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3050.xy, uint(rint(_3050.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3050.xy, uint(rint(_3050.z)), level(0.0)).y;
                _973 = _1169;
            }
            _975 = false;
            float _1171 = _973;
            float _1173 = _181 * 2000.0;
            float _1175 = _183 * 2000.0;
            float _1177 = precise::max(_1173, 220.0);
            float _1179 = precise::max(_1175, 220.0);
            float _1181 = _1177 + _707;
            float _1183 = _1179 + _1171;
            _115 = as_type<int>(_1181);
            _123 = as_type<int>(_1183);
        }
        int _1185 = _113;
        int _1187 = _115;
        int _1189 = _117;
        int _1191 = _119;
        int _1193 = _121;
        int _1195 = _123;
        int _1197 = _125;
        int _1199 = _127;
        int _1201 = _80 * 48;
        bool _1203 = as_type<int>(_91) != 2;
        int _1205 = _1201 + 16;
        uint _1207 = uint(int(uint(_1201) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1207)] = uint(_1185);
        int _1209 = _1201 + 4;
        uint _1211 = uint(int(uint(_1209) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1211)] = uint(_1187);
        int _1213 = _1201 + 8;
        uint _1215 = uint(int(uint(_1213) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1215)] = uint(_1189);
        int _1217 = _1201 + 12;
        uint _1219 = uint(int(uint(_1217) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1219)] = uint(_1191);
        int _1221 = _1201 + 32;
        int _1223 = _1201 + 36;
        uint _1225 = uint(int(uint(_1205) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1225)] = uint(_1193);
        int _1227 = _1205 + 4;
        uint _1229 = uint(int(uint(_1227) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1229)] = uint(_1195);
        int _1231 = _1205 + 8;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1233)] = uint(_1197);
        int _1235 = _1205 + 12;
        uint _1237 = uint(int(uint(_1235) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1237)] = uint(_1199);
        bool _1239 = !_1203;
        int _1241 = _1239 ? 0 : 1;
        int _1243 = _1201 + 40;
        uint _1245 = uint(int(uint(_1221) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1245)] = 0u;
        int _1247 = _1201 + 44;
        uint _1249 = uint(int(uint(_1223) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1249)] = 0u;
        uint _1251 = uint(int(uint(_1243) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1251)] = uint(_1241);
        uint _1253 = uint(int(uint(_1247) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_1253)] = 0u;
        uint _1255 = uint(int(uint(_86) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1255)] = 0u;
        return;
    }
    _111 = false;
}

