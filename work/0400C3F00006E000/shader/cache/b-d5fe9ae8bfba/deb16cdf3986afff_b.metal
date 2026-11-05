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
    constant _16* cp_c6 [[id(1)]];
    constant _16* cp_c7 [[id(2)]];
    constant _16* cp_c5 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    constant _16* cp_c4 [[id(5)]];
    device _33* cp_s0 [[id(6)]];
    device _33* cp_s1 [[id(7)]];
    device _33* cp_s2 [[id(8)]];
    device _33* cp_s3 [[id(9)]];
    texture2d<float> cp_t_tcb_8 [[id(10)]];
    sampler cp_t_tcb_8Smplr [[id(11)]];
    texture2d<float> cp_t_tcb_A [[id(12)]];
    sampler cp_t_tcb_ASmplr [[id(13)]];
    texture2d_array<float> cp_t_tcb_E [[id(14)]];
    sampler cp_t_tcb_ESmplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_10 [[id(16)]];
    sampler cp_t_tcb_10Smplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_12 [[id(18)]];
    sampler cp_t_tcb_12Smplr [[id(19)]];
    texture2d_array<float> cp_t_tcb_C [[id(20)]];
    sampler cp_t_tcb_CSmplr [[id(21)]];
    sampler cp_t_tcb_8Smplr_w [[id(22)]];
    sampler cp_t_tcb_ASmplr_w [[id(23)]];
    sampler cp_t_tcb_ESmplr_w [[id(24)]];
    sampler cp_t_tcb_10Smplr_w [[id(25)]];
    sampler cp_t_tcb_12Smplr_w [[id(26)]];
    sampler cp_t_tcb_CSmplr_w [[id(27)]];
    constant dm_border_t* dm_border [[id(28)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _111 = false;
    bool _437 = false;
    bool _367 = false;
    bool _365 = false;
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
        bool _107 = as_type<int>(_103) == 272;
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
        if (!_109)
        {
            _113 = 0;
            _115 = 0;
            _117 = 0;
            _119 = 0;
        }
        if (false || _109)
        {
            _109 = false;
            int _121 = _80 << 4;
            uint _123 = uint(int(uint(_121) >> uint(2)));
            float _125 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_123)]);
            int _127 = _121 + 8;
            uint _129 = uint(int(uint(_127) >> uint(2)));
            float _131 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_129)]);
            int _133 = _121 + 12;
            uint _135 = uint(int(uint(_133) >> uint(2)));
            float _137 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_135)]);
            float _139 = fma(_125, 6.2500002968590706586837768554688e-05, 0.5);
            float _141 = fma(_131, 6.2500002968590706586837768554688e-05, 0.5);
            float2 _818 = float2(_139, _141);
            float _143 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_818, float2(0.0), isnan(_818)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_818, float2(0.0), isnan(_818)), level(0.0)).x;
            float _145 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[64]);
            float _147 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[65]);
            float2 _836 = float2(_139, _141);
            float _149 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_836, float2(0.0), isnan(_836)), level(_143)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_836, float2(0.0), isnan(_836)), level(_143)).y;
            int _151 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 1;
            bool _153 = _151 != 0;
            int _155 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 2;
            bool _157 = _155 != 0;
            int _159 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 4;
            bool _161 = _159 != 0;
            int _163 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) & 8;
            bool _165 = _163 != 0;
            float _167 = 0.0;
            float _169 = _139;
            float _171 = _141;
            int _173 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            bool _175 = _153;
            int _177 = _157 ? (-1) : 0;
            _117 = as_type<int>(_131);
            _119 = as_type<int>(_137);
            if (_153)
            {
                float _179 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
                float _181 = _125 + _179;
                _167 = _181;
            }
            float _183 = _167;
            float _185 = 0.0;
            float _187 = _183;
            if (_153)
            {
                float _189 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
                float _191 = _131 + _189;
                _185 = _191;
            }
            float _193 = _185;
            float _195 = 0.0;
            float _197 = _193;
            if (_157)
            {
                float _199 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
                float _201 = _125 + _199;
                _195 = _201;
            }
            float _203 = _195;
            float _205 = 0.0;
            if (_157)
            {
                float _207 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
                float _209 = _131 + _207;
                _205 = _209;
            }
            float _211 = _205;
            float _213 = _211;
            if (_161)
            {
                float _215 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
                float _217 = _125 + _215;
                _169 = _217;
            }
            float _219 = _169;
            float _221 = _219;
            if (_161)
            {
                float _223 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
                float _225 = _131 + _223;
                _171 = _225;
            }
            float _227 = _171;
            float _229 = _227;
            if (_153)
            {
                float _231 = abs(_183);
                float _233 = abs(_193);
                float _235 = precise::max(_231, _233);
                _197 = _235;
            }
            float _237 = _197;
            float _239 = _237;
            if (!_153)
            {
                _187 = 10000.0;
            }
            float _241 = _187;
            float _243 = _241;
            if (_157)
            {
                float _245 = abs(_203);
                float _247 = abs(_211);
                float _249 = precise::max(_245, _247);
                _213 = _249;
            }
            float _251 = _213;
            if (!_157)
            {
                _173 = 0;
            }
            int _253 = _173;
            int _255 = _253;
            if (_153)
            {
                float _257 = precise::min(_237, 10000.0);
                _243 = _257;
            }
            float _259 = _243;
            float _261 = _259;
            if (_165)
            {
                float _263 = -_147;
                float _265 = _131 + _263;
                _239 = _265;
            }
            float _267 = _239;
            float _269 = _267;
            if (_161)
            {
                float _271 = abs(_219);
                float _273 = abs(_227);
                float _275 = precise::max(_271, _273);
                _221 = _275;
            }
            float _277 = _221;
            if (_165)
            {
                float _279 = -_145;
                float _281 = _125 + _279;
                _229 = _281;
            }
            float _283 = _229;
            if (_157)
            {
                bool _285 = _259 > _251;
                _175 = _285;
            }
            bool _287 = _175;
            if (_157)
            {
                float _289 = _287 ? _251 : _259;
                _261 = _289;
            }
            float _291 = _261;
            float _293 = _291;
            if (_157)
            {
                bool _295 = !_287;
                int _297 = _295 ? 0 : 1;
                _255 = _297;
            }
            int _299 = _255;
            bool _301 = false;
            int _303 = _299;
            if (_161)
            {
                bool _305 = _291 > _277;
                _301 = _305;
            }
            bool _307 = _301;
            if (_165)
            {
                float _309 = abs(_283);
                float _311 = abs(_267);
                float _313 = precise::max(_309, _311);
                _269 = _313;
            }
            float _315 = _269;
            if (_161)
            {
                float _317 = _307 ? _277 : _291;
                _293 = _317;
            }
            float _319 = _293;
            if (_161)
            {
                bool _321 = !_307;
                int _323 = _321 ? _299 : 2;
                _303 = _323;
            }
            int _325 = _303;
            int _327 = _325;
            if (_165)
            {
                bool _329 = _319 > _315;
                _177 = _329 ? (-1) : 0;
            }
            int _331 = _177;
            if (_165)
            {
                int _333 = ~_331;
                int _335 = (_333 != 0) ? _325 : 3;
                _327 = _335;
            }
            int _337 = _327;
            bool _339 = _337 != 0;
            bool _341 = !_339;
            float _435;
            if (!_341)
            {
                int _343 = _337 + (-1);
                uint _345 = min(uint(_343), 3u);
                int _347 = int(_345) * 4;
                int _349 = _347 + 12;
                uint _351 = uint(int(uint(_349) >> uint(2)));
                uint _353 = uint(int(uint(int(_351)) >> uint(2)));
                int _355 = int(_351) & 3;
                float _357 = (*spvDescriptorSet0.cp_c1)._m0[int(_353)][_355];
                bool _359 = as_type<int>(_357) == 1072;
                float _361 = as_type<float>(_347);
                if (!_359)
                {
                    bool _363 = as_type<int>(_357) == 1392;
                    _365 = _363;
                    if (!_365)
                    {
                        _367 = true;
                    }
                }
                if (!_365)
                {
                    if (!_367)
                    {
                        float _369 = -(*spvDescriptorSet0.cp_c6)._m0[16].x;
                        float _371 = _125 + _369;
                        int _373 = as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z) << 4;
                        float _375 = -(*spvDescriptorSet0.cp_c6)._m0[16].y;
                        float _377 = _131 + _375;
                        float _379 = abs(_371);
                        float _381 = abs(_377);
                        float _383 = precise::max(_379, _381);
                        uint _385 = uint(int(uint(_373) >> uint(2)));
                        uint _387 = uint(int(uint(int(_385)) >> uint(2)));
                        int _389 = int(_385) & 3;
                        float _391 = (*spvDescriptorSet0.cp_c6)._m0[int(_387)][_389];
                        float _393 = _383 * _391;
                        float _395 = _393 * 4.0;
                        float _397 = precise::max(_395, 1.0);
                        float _399 = log2(_397);
                        float _401 = precise::min(_399, 5.0);
                        float _403 = floor(_401);
                        int _405 = int(_403);
                        float _407 = floor(_401);
                        int _409 = _405 + as_type<int>((*spvDescriptorSet0.cp_c6)._m0[16].z);
                        int _411 = _409 * 16;
                        float _413 = rint(_407);
                        float _415 = precise::max(_413, 0.0);
                        uint _417 = uint(_415);
                        uint _419 = clamp(_417, 0u, 65535u);
                        uint _421 = uint(int(uint(_411) >> uint(2)));
                        uint _423 = uint(int(uint(int(_421)) >> uint(2)));
                        int _425 = int(_421) & 3;
                        float _427 = (*spvDescriptorSet0.cp_c6)._m0[int(_423)][_425];
                        float _429 = fma(_427, _377, 0.5);
                        float _431 = fma(_427, _371, 0.5);
                        float3 _1280 = float3(_431, _429, float(int(_419)));
                        float3 _1284 = select(_1280, float3(0.0), isnan(_1280));
                        float _433 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _1284.xy, uint(rint(_1284.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _1284.xy, uint(rint(_1284.z)), level(0.0)).y;
                        _435 = _433;
                        _437 = true;
                    }
                }
                if (((!_437) || _367) || _365)
                {
                    if ((!_367) || _365)
                    {
                        _365 = false;
                        float _439 = -(*spvDescriptorSet0.cp_c7)._m0[16].x;
                        float _441 = _125 + _439;
                        int _443 = as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z) << 4;
                        float _445 = -(*spvDescriptorSet0.cp_c7)._m0[16].y;
                        float _447 = _131 + _445;
                        float _449 = abs(_441);
                        float _451 = abs(_447);
                        float _453 = precise::max(_449, _451);
                        uint _455 = uint(int(uint(_443) >> uint(2)));
                        uint _457 = uint(int(uint(int(_455)) >> uint(2)));
                        int _459 = int(_455) & 3;
                        float _461 = (*spvDescriptorSet0.cp_c7)._m0[int(_457)][_459];
                        float _463 = _453 * _461;
                        float _465 = _463 * 4.0;
                        float _467 = precise::max(_465, 1.0);
                        float _469 = log2(_467);
                        float _471 = precise::min(_469, 5.0);
                        float _473 = floor(_471);
                        int _475 = int(_473);
                        float _477 = floor(_471);
                        int _479 = _475 + as_type<int>((*spvDescriptorSet0.cp_c7)._m0[16].z);
                        int _481 = _479 * 16;
                        float _483 = rint(_477);
                        float _485 = precise::max(_483, 0.0);
                        uint _487 = uint(_485);
                        uint _489 = clamp(_487, 0u, 65535u);
                        uint _491 = uint(int(uint(_481) >> uint(2)));
                        uint _493 = uint(int(uint(int(_491)) >> uint(2)));
                        int _495 = int(_491) & 3;
                        float _497 = (*spvDescriptorSet0.cp_c7)._m0[int(_493)][_495];
                        float _499 = fma(_497, _447, 0.5);
                        float _501 = fma(_497, _441, 0.5);
                        float3 _1399 = float3(_501, _499, float(int(_489)));
                        float3 _1401 = select(_1399, float3(0.0), isnan(_1399));
                        float _503 = dm_bs(spvDescriptorSet0.cp_t_tcb_10.sample(spvDescriptorSet0.cp_t_tcb_10Smplr, _1401.xy, uint(rint(_1401.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_10, spvDescriptorSet0.cp_t_tcb_10Smplr_w, _1401.xy, uint(rint(_1401.z)), level(0.0)).y;
                        _435 = _503;
                        _437 = true;
                    }
                    if ((!_437) || _367)
                    {
                        _367 = false;
                        bool _505 = _337 != 3;
                        if (_505)
                        {
                            _361 = 0.0;
                        }
                        float _507 = _361;
                        _435 = _507;
                        _437 = _505;
                        if (!_437)
                        {
                            float _509 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[66]);
                            int _511 = as_type<int>(_509) << 4;
                            uint _513 = uint(int(uint(_511) >> uint(2)));
                            float _515 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_513)]);
                            float _517 = -_145;
                            float _519 = _125 + _517;
                            float _521 = -_147;
                            float _523 = _131 + _521;
                            float _525 = abs(_519);
                            float _527 = abs(_523);
                            float _529 = precise::max(_525, _527);
                            float _531 = _515 * _529;
                            float _533 = _531 * 4.0;
                            float _535 = precise::max(_533, 1.0);
                            float _537 = log2(_535);
                            float _539 = precise::min(_537, 5.0);
                            float _541 = floor(_539);
                            int _543 = int(_541);
                            int _545 = as_type<int>(_509) + _543;
                            int _547 = _545 << 4;
                            uint _549 = uint(int(uint(_547) >> uint(2)));
                            float _551 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_549)]);
                            float _553 = floor(_539);
                            float _555 = rint(_553);
                            float _557 = precise::max(_555, 0.0);
                            uint _559 = uint(_557);
                            uint _561 = clamp(_559, 0u, 65535u);
                            float _563 = fma(_551, _523, 0.5);
                            float _565 = fma(_551, _519, 0.5);
                            float3 _1505 = float3(_565, _563, float(int(_561)));
                            float3 _1507 = select(_1505, float3(0.0), isnan(_1505));
                            float _567 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _1507.xy, uint(rint(_1507.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _1507.xy, uint(rint(_1507.z)), level(0.0)).y;
                            _435 = _567;
                            _437 = true;
                        }
                    }
                }
            }
            else
            {
                float _569 = -(*spvDescriptorSet0.cp_c5)._m0[16].x;
                float _571 = _125 + _569;
                int _573 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z) << 4;
                float _575 = -(*spvDescriptorSet0.cp_c5)._m0[16].y;
                float _577 = _131 + _575;
                float _579 = abs(_571);
                float _581 = abs(_577);
                float _583 = precise::max(_579, _581);
                uint _585 = uint(int(uint(_573) >> uint(2)));
                uint _587 = uint(int(uint(int(_585)) >> uint(2)));
                int _589 = int(_585) & 3;
                float _591 = (*spvDescriptorSet0.cp_c5)._m0[int(_587)][_589];
                float _593 = _583 * _591;
                float _595 = _593 * 4.0;
                float _597 = precise::max(_595, 1.0);
                float _599 = log2(_597);
                float _601 = precise::min(_599, 5.0);
                float _603 = floor(_601);
                int _605 = int(_603);
                float _607 = floor(_601);
                int _609 = _605 + as_type<int>((*spvDescriptorSet0.cp_c5)._m0[16].z);
                int _611 = _609 * 16;
                float _613 = rint(_607);
                float _615 = precise::max(_613, 0.0);
                uint _617 = uint(_615);
                uint _619 = clamp(_617, 0u, 65535u);
                uint _621 = uint(int(uint(_611) >> uint(2)));
                uint _623 = uint(int(uint(int(_621)) >> uint(2)));
                int _625 = int(_621) & 3;
                float _627 = (*spvDescriptorSet0.cp_c5)._m0[int(_623)][_625];
                float _629 = fma(_627, _577, 0.5);
                float _631 = fma(_627, _571, 0.5);
                float3 _1612 = float3(_631, _629, float(int(_619)));
                float3 _1614 = select(_1612, float3(0.0), isnan(_1612));
                float _633 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _1614.xy, uint(rint(_1614.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _1614.xy, uint(rint(_1614.z)), level(0.0)).y;
                _435 = _633;
            }
            _437 = false;
            float _635 = _435;
            float _637 = _149 * 2000.0;
            float _639 = precise::max(_637, 220.0);
            float _641 = _639 + _635;
            _113 = as_type<int>(_125);
            _115 = as_type<int>(_641);
        }
        int _643 = _113;
        int _645 = _115;
        int _647 = _117;
        int _649 = _119;
        int _651 = _80 * 24;
        bool _653 = as_type<int>(_91) != 2;
        int _655 = _651 + 4;
        uint _657 = uint(int(uint(_651) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_657)] = uint(_643);
        int _659 = _651 + 8;
        int _661 = _651 + 12;
        uint _663 = uint(int(uint(_655) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_663)] = uint(_645);
        int _665 = _651 + 16;
        int _667 = _651 + 20;
        uint _669 = uint(int(uint(_659) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_669)] = uint(_647);
        bool _671 = !_653;
        int _673 = _671 ? 0 : 1;
        uint _675 = uint(int(uint(_661) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_675)] = uint(_649);
        uint _677 = uint(int(uint(_665) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_677)] = 0u;
        uint _679 = uint(int(uint(_667) >> uint(2)));
        (*spvDescriptorSet0.cp_s3)._m0[int(_679)] = uint(_673);
        uint _681 = uint(int(uint(_86) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_681)] = 0u;
        return;
    }
    _111 = false;
}

