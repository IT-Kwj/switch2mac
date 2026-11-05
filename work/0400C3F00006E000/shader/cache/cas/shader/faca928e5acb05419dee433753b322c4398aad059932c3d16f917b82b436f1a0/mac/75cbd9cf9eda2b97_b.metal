#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c5 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _531 = false;
    bool _581 = false;
    bool _1371 = false;
    bool _1271 = false;
    bool _1169 = false;
    bool _287 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_40.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_40.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _1754 = float2(_66, _68);
    float4 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1754, float2(0.0), isnan(_1754))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1754, float2(0.0), isnan(_1754))).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    float _81 = _68 + (-0.5);
    float _83 = _66 + (-0.5);
    float _85 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _87 = _83 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _89 = _85 * _85;
    bool _93 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _95 = isnan(0.0);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _101 = _97 || _99;
    float _103 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _105 = fma(_87, _87, _89);
    float _107 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _109 = -_107;
    float _111 = fma(_109, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    bool _113 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    bool _115 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _117 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _119 = _115 || _117;
    bool _121 = isnan(-1.0999999631167156621813774108887e-06);
    bool _123 = _119 || _121;
    float _125 = sqrt(_105);
    float _127 = precise::max(0.0, _111);
    float _129 = -_127;
    float _131 = _103 + _129;
    float _133 = 1.0 / _131;
    float _135 = -_127;
    float _137 = _125 + _135;
    float _139 = _137 * _133;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    int _144 = _123 ? 0 : 1;
    float _146 = _103;
    float _148 = _127;
    float _150 = _125;
    float _152 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    if (_101)
    {
        float _154 = _75 * 0.715200006961822509765625;
        _146 = _154;
    }
    float _156 = _146;
    float _158 = _156;
    if (_101)
    {
        float _160 = fma(_73, 0.2125999927520751953125, _156);
        _158 = _160;
    }
    float _162 = _158;
    if (_101)
    {
        float _164 = fma(_77, 0.072200000286102294921875, _162);
        _148 = _164;
    }
    float _166 = _148;
    float _168 = fma(_141, -2.0, 3.0);
    float _170 = _141 * _141;
    float _172 = _166;
    float _174 = _168;
    if (_101)
    {
        float _176 = 1.0 / _166;
        _172 = _176;
    }
    float _178 = _172;
    float _180 = fma(_170, _168, -0.5);
    if (!_101)
    {
        _174 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _182 = _174;
    float _184 = _182;
    if (_101)
    {
        float _186 = _178 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _188 = precise::clamp(_186, 0.0, 1.0);
        _150 = _188;
    }
    float _190 = _150;
    int _192 = ~_144;
    int _194 = _192 + 1;
    int _196 = _194 + 1;
    int _198 = _196;
    if (!_113)
    {
        int _200 = ~_144;
        int _202 = _200 + 1;
        _198 = _202;
    }
    int _204 = _198;
    if (_101)
    {
        float _206 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _184 = _206;
    }
    float _208 = _184;
    float _210 = _75 * _208;
    float _212 = _210 * 4.0;
    float _214 = _73 * _208;
    float _216 = _214 * 4.0;
    float _218 = float(_204);
    float _220 = _77 * _208;
    float _222 = _220 * 4.0;
    uint _225 = as_type<uint>(half2(float2(_216, _212)));
    float _227 = fma(_180, _218, 0.5);
    uint _229 = as_type<uint>(half2(float2(_222, 0.0)));
    uint _231 = extract_bits(_225, 16u, 16u);
    float _233 = float(_231);
    int _235 = int(_225) & 32767;
    float _237 = precise::max(_227, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    uint _239 = extract_bits(_229, 0u, 8u);
    int _241 = int(_239) & 255;
    uint _243 = extract_bits(_229, 8u, 8u);
    int _245 = int(_243) & 255;
    int _247 = _245 << 8;
    int _249 = _241 | _247;
    bool _251 = _237 > 0.999000012874603271484375;
    float _253 = float(uint(_249));
    float _255 = float(uint(_235));
    float _257 = fma(_233, 6.103515625e-05, -0.3125);
    float _259 = fma(_253, 6.103515625e-05, -0.3125);
    float _261 = fma(_255, 6.103515625e-05, -0.3125);
    float _263 = fma(_257, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _265 = fma(_259, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _267 = fma(_261, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _269 = !_251;
    float _281;
    float _283;
    float _285;
    if (!_269)
    {
        float3 _2067 = float3(_267, _263, _265);
        float3 _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2067, float3(0.0), isnan(_2067))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2067, float3(0.0), isnan(_2067))).xyz;
        float _275 = _273.x;
        float _277 = _273.y;
        float _279 = _273.z;
        _281 = _275;
        _283 = _277;
        _285 = _279;
        _287 = true;
    }
    else
    {
        float3 _2089 = float3(_267, _263, _265);
        float3 _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2089, float3(0.0), isnan(_2089))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2089, float3(0.0), isnan(_2089))).xyz;
        float _291 = _289.x;
        float _293 = _289.y;
        float _295 = _289.z;
        float3 _2104 = float3(_267, _263, _265);
        float3 _297 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2104, float3(0.0), isnan(_2104))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2104, float3(0.0), isnan(_2104))).xyz;
        float _299 = _297.x;
        float _301 = _297.y;
        float _303 = _297.z;
        bool _305 = _237 >= 0.001000000047497451305389404296875;
        bool _307 = isnan(_237);
        bool _309 = _305 || _307;
        bool _311 = isnan(0.001000000047497451305389404296875);
        bool _313 = _309 || _311;
        bool _315 = !_313;
        _281 = _291;
        _283 = _293;
        _285 = _295;
        if (!_315)
        {
            float3 _2139 = float3(_267, _263, _265);
            float3 _317 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2139, float3(0.0), isnan(_2139))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2139, float3(0.0), isnan(_2139))).xyz;
            float _319 = _317.x;
            float _321 = _317.y;
            float _323 = _317.z;
            float _325 = -_299;
            float _327 = _319 + _325;
            float _329 = -_301;
            float _331 = _321 + _329;
            float _333 = -_303;
            float _335 = _323 + _333;
            float _337 = fma(_237, _327, _299);
            float _339 = fma(_237, _331, _301);
            float _341 = fma(_237, _335, _303);
            _281 = _337;
            _283 = _339;
            _285 = _341;
        }
    }
    _287 = false;
    float _343 = _281;
    float _345 = _283;
    float _347 = _285;
    bool _349 = _343 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _351 = isnan(_343);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _357 = _353 || _355;
    float _359 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _361 = fma(_345, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _363 = fma(_347, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _365 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _367 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _369 = _365 || _367;
    bool _371 = isnan(6.0);
    bool _373 = _369 || _371;
    bool _375 = _345 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _377 = isnan(_345);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _383 = _379 || _381;
    float _385 = exp2(_359);
    bool _387 = _347 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _389 = isnan(_347);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _395 = _391 || _393;
    float _397 = exp2(_361);
    float _399 = exp2(_363);
    float _401 = -_385;
    float _403 = _401 + 1.0;
    bool _405 = !_357;
    float _407 = _405 ? _343 : _403;
    float _409 = -_397;
    float _411 = _409 + 1.0;
    bool _413 = !_383;
    float _415 = _413 ? _345 : _411;
    float _417 = -_399;
    float _419 = _417 + 1.0;
    bool _421 = !_395;
    float _423 = _421 ? _347 : _419;
    float _425 = _397;
    float _427 = _399;
    float _429 = _419;
    float _431 = _397;
    float _433 = _399;
    float _435 = _407;
    float _437 = _415;
    float _439 = _423;
    float _525;
    float _527;
    float _529;
    if (!_373)
    {
        float _441 = -_407;
        float _443 = _441 + 1.0;
        float _445 = -_415;
        float _447 = _445 + 1.0;
        float _449 = -_423;
        float _451 = _449 + 1.0;
        float _453 = abs(_443);
        float _455 = log2(_453);
        float _457 = abs(_447);
        float _459 = log2(_457);
        float _461 = abs(_451);
        float _463 = log2(_461);
        float _465 = _455 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _467 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _469 = _459 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _471 = exp2(_465);
        float _473 = _463 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _475 = exp2(_469);
        float _477 = exp2(_473);
        float _479 = fma(_467, _471, 1.0);
        float _481 = fma(_467, _475, 1.0);
        float _483 = 1.0 / _479;
        float _485 = fma(_467, _477, 1.0);
        float _487 = 1.0 / _481;
        float _489 = 1.0 / _485;
        float _491 = _483 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _493 = _487 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _495 = precise::max(_491, _493);
        float _497 = _489 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _499 = precise::max(_497, _495);
        float _501 = -_491;
        float _503 = _501 + _499;
        float _505 = -_493;
        float _507 = _505 + _499;
        float _509 = -_497;
        float _511 = _509 + _499;
        float _513 = fma(_503, (*spvDescriptorSet0.fp_c3)._m0[6].w, _491);
        float _515 = fma(_507, (*spvDescriptorSet0.fp_c3)._m0[6].w, _493);
        float _517 = fma(_511, (*spvDescriptorSet0.fp_c3)._m0[6].w, _497);
        float _519 = _407 * _513;
        float _521 = _415 * _515;
        float _523 = _423 * _517;
        _525 = _519;
        _527 = _521;
        _529 = _523;
        _531 = true;
    }
    else
    {
        bool _533 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_533)
        {
            _152 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _535 = _152;
        bool _537 = !_533;
        float _539 = _535;
        float _569;
        float _571;
        float _579;
        if (!_537)
        {
            float _541 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _543 = _66 + _541;
            float _545 = abs(_543);
            float _547 = _545 * 2560.0;
            bool _549 = _547 >= 2.0;
            bool _551 = isnan(_547);
            bool _553 = _549 || _551;
            bool _555 = isnan(2.0);
            bool _557 = _553 || _555;
            float _559 = _547;
            if (!_557)
            {
                _559 = 0.0;
                _425 = 0.0;
            }
            float _561 = _559;
            float _563 = _425;
            float _565 = _561;
            float _567 = _563;
            _569 = _561;
            _571 = _563;
            if (!_557)
            {
                _427 = 0.0;
            }
            float _573 = _427;
            bool _575 = !_557;
            float _577 = _573;
            _579 = _573;
            _581 = _575;
            if (!_581)
            {
                bool _583 = _66 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_583)
                {
                    _565 = _407;
                }
                float _585 = _565;
                _429 = _585;
                _569 = _585;
                if (_583)
                {
                    _567 = _415;
                }
                float _587 = _567;
                _431 = _587;
                _571 = _587;
                if (_583)
                {
                    _577 = _423;
                }
                float _589 = _577;
                _433 = _589;
                _579 = _589;
                _581 = _583;
                if (!_581)
                {
                    float _591 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _539 = _591;
                }
            }
        }
        if (!_581)
        {
            float _593 = _539;
            float _595 = _429;
            float _597 = _431;
            float _599 = _433;
            bool _601 = _593 != 0.0;
            bool _603 = isnan(_593);
            bool _605 = _601 || _603;
            bool _607 = isnan(0.0);
            bool _609 = _605 || _607;
            float _611 = _595;
            float _613 = _595;
            float _615 = _595;
            float _617 = _597;
            float _619 = _599;
            if (!_609)
            {
                float _621 = _345 * 0.586600005626678466796875;
                float _623 = fma(_343, 0.29890000820159912109375, _621);
                float _625 = fma(_347, 0.1143999993801116943359375, _623);
                float _627 = _625 * (-1.44269502162933349609375);
                float _629 = exp2(_627);
                float _631 = -_629;
                float _633 = _631 + 1.0;
                bool _635 = _633 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _637 = isnan(_633);
                bool _639 = _635 || _637;
                bool _641 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _643 = _639 || _641;
                if (!_643)
                {
                    _611 = _633;
                }
                float _645 = _611;
                bool _647 = !_643;
                float _649 = _645;
                if (!_647)
                {
                    float _651 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _653 = _633 + _651;
                    float _655 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _657 = spvFAdd(_655, 1.00000095367431640625);
                    float _659 = 1.0 / _657;
                    float _661 = _653 * _659;
                    float _663 = -_661;
                    float _665 = _663 + 1.0;
                    float _667 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _669 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _667;
                    float _671 = abs(_665);
                    float _673 = log2(_671);
                    float _675 = _669 * _659;
                    float _677 = _675 + (-1.0);
                    float _679 = _675 * _661;
                    float _681 = _673 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _683 = exp2(_681);
                    float _685 = fma(_677, _683, 1.0);
                    float _687 = 1.0 / _685;
                    float _689 = _679 * _687;
                    float _691 = fma(_657, _689, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _649 = _691;
                }
                float _693 = _649;
                float _695 = -_633;
                float _697 = _695 + _693;
                float _699 = _415 * 0.586600005626678466796875;
                float _701 = _697 + 1.0;
                float _703 = fma(_407, 0.29890000820159912109375, _699);
                float _705 = fma(_423, 0.1143999993801116943359375, _703);
                float _707 = abs(_701);
                float _709 = log2(_707);
                float _711 = spvFAdd(_705, 9.9999999747524270787835121154785e-07);
                float _713 = 1.0 / _711;
                float _715 = _709 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _717 = exp2(_715);
                float _719 = fma(_407, _713, -1.0);
                float _721 = fma(_415, _713, -1.0);
                float _723 = fma(_423, _713, -1.0);
                float _725 = fma(_717, _719, 1.0);
                float _727 = fma(_717, _721, 1.0);
                float _729 = fma(_717, _723, 1.0);
                float _731 = _725 * _693;
                float _733 = _727 * _693;
                float _735 = _729 * _693;
                float _737 = precise::max(0.0, _731);
                float _739 = precise::max(0.0, _733);
                float _741 = precise::max(0.0, _735);
                float _743 = precise::min(_737, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _745 = precise::min(_739, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _747 = precise::min(_741, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _569 = _743;
                _571 = _745;
                _579 = _747;
                _581 = true;
            }
            else
            {
                bool _749 = _593 != 1.0;
                bool _751 = isnan(_593);
                bool _753 = _749 || _751;
                bool _755 = isnan(1.0);
                bool _757 = _753 || _755;
                if (!_757)
                {
                    bool _759 = _407 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _761 = isnan(_407);
                    bool _763 = _759 || _761;
                    bool _765 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _767 = _763 || _765;
                    float _769 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _771 = spvFAdd(_769, 1.00000095367431640625);
                    bool _773 = _415 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _775 = isnan(_415);
                    bool _777 = _773 || _775;
                    bool _779 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _781 = _777 || _779;
                    bool _783 = _423 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _785 = isnan(_423);
                    bool _787 = _783 || _785;
                    bool _789 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _791 = _787 || _789;
                    float _793 = 1.0 / _771;
                    float _795 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _797 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _795;
                    float _799 = _797 * _793;
                    bool _801 = !_767;
                    if (!_801)
                    {
                        float _803 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _805 = _407 + _803;
                        float _807 = _799 + (-1.0);
                        float _809 = _805 * _793;
                        float _811 = -_809;
                        float _813 = _811 + 1.0;
                        float _815 = _799 * _809;
                        float _817 = abs(_813);
                        float _819 = log2(_817);
                        float _821 = _819 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _823 = exp2(_821);
                        float _825 = fma(_807, _823, 1.0);
                        float _827 = 1.0 / _825;
                        float _829 = _815 * _827;
                        float _831 = fma(_771, _829, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _435 = _831;
                    }
                    float _833 = _435;
                    bool _835 = !_781;
                    if (!_835)
                    {
                        float _837 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _839 = _415 + _837;
                        float _841 = _799 + (-1.0);
                        float _843 = _839 * _793;
                        float _845 = -_843;
                        float _847 = _845 + 1.0;
                        float _849 = _799 * _843;
                        float _851 = abs(_847);
                        float _853 = log2(_851);
                        float _855 = _853 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _857 = exp2(_855);
                        float _859 = fma(_841, _857, 1.0);
                        float _861 = 1.0 / _859;
                        float _863 = _849 * _861;
                        float _865 = fma(_771, _863, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _437 = _865;
                    }
                    float _867 = _437;
                    bool _869 = !_791;
                    if (!_869)
                    {
                        float _871 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _873 = _423 + _871;
                        float _875 = _799 + (-1.0);
                        float _877 = _873 * _793;
                        float _879 = -_877;
                        float _881 = _879 + 1.0;
                        float _883 = _799 * _877;
                        float _885 = abs(_881);
                        float _887 = log2(_885);
                        float _889 = _887 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _891 = exp2(_889);
                        float _893 = fma(_875, _891, 1.0);
                        float _895 = 1.0 / _893;
                        float _897 = _883 * _895;
                        float _899 = fma(_771, _897, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _439 = _899;
                    }
                    float _901 = _439;
                    float _903 = precise::max(0.0, _901);
                    float _905 = precise::max(0.0, _833);
                    float _907 = precise::max(0.0, _867);
                    float _909 = precise::min(_903, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _911 = precise::min(_905, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _913 = precise::min(_907, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _569 = _911;
                    _571 = _913;
                    _579 = _909;
                    _581 = true;
                }
                else
                {
                    bool _915 = _593 != 2.0;
                    bool _917 = isnan(_593);
                    bool _919 = _915 || _917;
                    bool _921 = isnan(2.0);
                    bool _923 = _919 || _921;
                    if (!_923)
                    {
                        float _925 = _415 * 0.715200006961822509765625;
                        float _927 = fma(_407, 0.2125999927520751953125, _925);
                        float _929 = fma(_423, 0.072200000286102294921875, _927);
                        float _931 = spvFAdd(_929, 9.9999999747524270787835121154785e-07);
                        bool _933 = _929 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _935 = isnan(_929);
                        bool _937 = _933 || _935;
                        bool _939 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _941 = _937 || _939;
                        float _943 = 1.0 / _931;
                        bool _945 = !_941;
                        float _947 = _929;
                        if (!_945)
                        {
                            float _949 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _951 = _929 + _949;
                            float _953 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _955 = spvFAdd(_953, 1.00000095367431640625);
                            float _957 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _959 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _957;
                            float _961 = 1.0 / _955;
                            float _963 = _951 * _961;
                            float _965 = _959 * _961;
                            float _967 = -_963;
                            float _969 = _967 + 1.0;
                            float _971 = _965 + (-1.0);
                            float _973 = _965 * _963;
                            float _975 = abs(_969);
                            float _977 = log2(_975);
                            float _979 = _977 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _981 = exp2(_979);
                            float _983 = fma(_971, _981, 1.0);
                            float _985 = 1.0 / _983;
                            float _987 = _973 * _985;
                            float _989 = fma(_955, _987, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _947 = _989;
                        }
                        float _991 = _947;
                        float _993 = precise::max(0.0, _991);
                        float _995 = precise::min(_993, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _997 = _995 * _943;
                        float _999 = _407 * _997;
                        float _1001 = _415 * _997;
                        float _1003 = _423 * _997;
                        float _1005 = precise::max(0.0, _999);
                        float _1007 = precise::max(0.0, _1001);
                        float _1009 = precise::max(0.0, _1003);
                        float _1011 = precise::min(_1005, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1013 = precise::min(_1007, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1015 = precise::min(_1009, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _569 = _1011;
                        _571 = _1013;
                        _579 = _1015;
                        _581 = true;
                    }
                    else
                    {
                        bool _1017 = _593 != 3.0;
                        bool _1019 = isnan(_593);
                        bool _1021 = _1017 || _1019;
                        bool _1023 = isnan(3.0);
                        bool _1025 = _1021 || _1023;
                        if (!_1025)
                        {
                            float _1027 = -_407;
                            float _1029 = _1027 + 1.0;
                            float _1031 = -_415;
                            float _1033 = _1031 + 1.0;
                            float _1035 = -_423;
                            float _1037 = _1035 + 1.0;
                            float _1039 = abs(_1029);
                            float _1041 = log2(_1039);
                            float _1043 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _1045 = abs(_1033);
                            float _1047 = log2(_1045);
                            float _1049 = abs(_1037);
                            float _1051 = log2(_1049);
                            float _1053 = _1041 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1055 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1057 = exp2(_1053);
                            float _1059 = _1051 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1061 = exp2(_1055);
                            float _1063 = exp2(_1059);
                            float _1065 = fma(_1043, _1057, 1.0);
                            float _1067 = fma(_1043, _1061, 1.0);
                            float _1069 = 1.0 / _1065;
                            float _1071 = fma(_1043, _1063, 1.0);
                            float _1073 = 1.0 / _1067;
                            float _1075 = 1.0 / _1071;
                            float _1077 = _1069 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1079 = _1069 + _1073;
                            float _1081 = _1073 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1083 = _1075 + _1079;
                            float _1085 = _1075 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1087 = precise::max(_1077, _1081);
                            float _1089 = _1083 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1091 = precise::max(_1085, _1087);
                            float _1093 = _1089 * 0.3333333432674407958984375;
                            float _1095 = -_1093;
                            float _1097 = _1091 + _1095;
                            float _1099 = fma(_1097, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1093);
                            float _1101 = -_1077;
                            float _1103 = _1101 + _1099;
                            float _1105 = -_1081;
                            float _1107 = _1105 + _1099;
                            float _1109 = -_1085;
                            float _1111 = _1109 + _1099;
                            float _1113 = fma(_1103, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1077);
                            float _1115 = fma(_1107, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1081);
                            float _1117 = fma(_1111, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1085);
                            float _1119 = _407 * _1113;
                            float _1121 = _415 * _1115;
                            float _1123 = _423 * _1117;
                            _569 = _1119;
                            _571 = _1121;
                            _579 = _1123;
                            _581 = true;
                        }
                        else
                        {
                            bool _1125 = _593 != 4.0;
                            bool _1127 = isnan(_593);
                            bool _1129 = _1125 || _1127;
                            bool _1131 = isnan(4.0);
                            bool _1133 = _1129 || _1131;
                            if (!_1133)
                            {
                                bool _1135 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1137 = isnan(0.0);
                                bool _1139 = _1135 || _1137;
                                bool _1141 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1143 = _1139 || _1141;
                                float _1165;
                                float _1167;
                                if (!_1143)
                                {
                                    float _1145 = -_407;
                                    float _1147 = _1145 + 1.0;
                                    float _1149 = abs(_1147);
                                    float _1151 = log2(_1149);
                                    float _1153 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1155 = _1151 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1157 = exp2(_1155);
                                    float _1159 = fma(_1153, _1157, 1.0);
                                    float _1161 = 1.0 / _1159;
                                    float _1163 = _1161 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1165 = _1151;
                                    _1167 = _1163;
                                    _1169 = true;
                                }
                                else
                                {
                                    float _1171 = spvFAdd(_407, 9.9999999747524270787835121154785e-07);
                                    bool _1173 = _407 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1175 = isnan(_407);
                                    bool _1177 = _1173 || _1175;
                                    bool _1179 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1181 = _1177 || _1179;
                                    float _1183 = 1.0 / _1171;
                                    if (!_1181)
                                    {
                                        _613 = _407;
                                    }
                                    float _1185 = _613;
                                    bool _1187 = !_1181;
                                    float _1189 = _1185;
                                    _1165 = _1183;
                                    if (!_1187)
                                    {
                                        float _1191 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1193 = _407 + _1191;
                                        float _1195 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1197 = spvFAdd(_1195, 1.00000095367431640625);
                                        float _1199 = 1.0 / _1197;
                                        float _1201 = _1193 * _1199;
                                        float _1203 = -_1201;
                                        float _1205 = _1203 + 1.0;
                                        float _1207 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1209 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1207;
                                        float _1211 = abs(_1205);
                                        float _1213 = log2(_1211);
                                        float _1215 = _1209 * _1199;
                                        float _1217 = _1215 + (-1.0);
                                        float _1219 = _1215 * _1201;
                                        float _1221 = _1213 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1223 = exp2(_1221);
                                        float _1225 = fma(_1217, _1223, 1.0);
                                        float _1227 = 1.0 / _1225;
                                        float _1229 = _1219 * _1227;
                                        float _1231 = fma(_1197, _1229, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1189 = _1231;
                                    }
                                    float _1233 = _1189;
                                    float _1235 = precise::max(0.0, _1233);
                                    float _1237 = precise::min(_1235, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1239 = _1237 * _1183;
                                    _1167 = _1239;
                                }
                                _1169 = false;
                                float _1241 = _1165;
                                float _1243 = _1167;
                                float _1245 = _1241;
                                float _1267;
                                float _1269;
                                if (!_1143)
                                {
                                    float _1247 = -_415;
                                    float _1249 = _1247 + 1.0;
                                    float _1251 = abs(_1249);
                                    float _1253 = log2(_1251);
                                    float _1255 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1257 = _1253 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1259 = exp2(_1257);
                                    float _1261 = fma(_1255, _1259, 1.0);
                                    float _1263 = 1.0 / _1261;
                                    float _1265 = _1263 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1267 = _1253;
                                    _1269 = _1265;
                                    _1271 = true;
                                }
                                else
                                {
                                    float _1273 = spvFAdd(_415, 9.9999999747524270787835121154785e-07);
                                    bool _1275 = _415 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1277 = isnan(_415);
                                    bool _1279 = _1275 || _1277;
                                    bool _1281 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1283 = _1279 || _1281;
                                    float _1285 = 1.0 / _1273;
                                    if (!_1283)
                                    {
                                        _1245 = _415;
                                    }
                                    float _1287 = _1245;
                                    bool _1289 = !_1283;
                                    float _1291 = _1287;
                                    _1267 = _1285;
                                    if (!_1289)
                                    {
                                        float _1293 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1295 = _415 + _1293;
                                        float _1297 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1299 = spvFAdd(_1297, 1.00000095367431640625);
                                        float _1301 = 1.0 / _1299;
                                        float _1303 = _1295 * _1301;
                                        float _1305 = -_1303;
                                        float _1307 = _1305 + 1.0;
                                        float _1309 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1311 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1309;
                                        float _1313 = abs(_1307);
                                        float _1315 = log2(_1313);
                                        float _1317 = _1311 * _1301;
                                        float _1319 = _1317 + (-1.0);
                                        float _1321 = _1317 * _1303;
                                        float _1323 = _1315 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1325 = exp2(_1323);
                                        float _1327 = fma(_1319, _1325, 1.0);
                                        float _1329 = 1.0 / _1327;
                                        float _1331 = _1321 * _1329;
                                        float _1333 = fma(_1299, _1331, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1291 = _1333;
                                    }
                                    float _1335 = _1291;
                                    float _1337 = precise::max(0.0, _1335);
                                    float _1339 = precise::min(_1337, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1341 = _1339 * _1285;
                                    _1269 = _1341;
                                }
                                _1271 = false;
                                float _1343 = _1267;
                                float _1345 = _1269;
                                float _1347 = _1343;
                                float _1369;
                                if (!_1143)
                                {
                                    float _1349 = -_423;
                                    float _1351 = _1349 + 1.0;
                                    float _1353 = abs(_1351);
                                    float _1355 = log2(_1353);
                                    float _1357 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1359 = _1355 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1361 = exp2(_1359);
                                    float _1363 = fma(_1357, _1361, 1.0);
                                    float _1365 = 1.0 / _1363;
                                    float _1367 = _1365 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1369 = _1367;
                                    _1371 = true;
                                }
                                else
                                {
                                    float _1373 = spvFAdd(_423, 9.9999999747524270787835121154785e-07);
                                    bool _1375 = _423 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1377 = isnan(_423);
                                    bool _1379 = _1375 || _1377;
                                    bool _1381 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1383 = _1379 || _1381;
                                    float _1385 = 1.0 / _1373;
                                    if (!_1383)
                                    {
                                        _1347 = _423;
                                    }
                                    float _1387 = _1347;
                                    bool _1389 = !_1383;
                                    float _1391 = _1387;
                                    if (!_1389)
                                    {
                                        float _1393 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1395 = _423 + _1393;
                                        float _1397 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1399 = spvFAdd(_1397, 1.00000095367431640625);
                                        float _1401 = 1.0 / _1399;
                                        float _1403 = _1395 * _1401;
                                        float _1405 = -_1403;
                                        float _1407 = _1405 + 1.0;
                                        float _1409 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1411 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1409;
                                        float _1413 = abs(_1407);
                                        float _1415 = log2(_1413);
                                        float _1417 = _1411 * _1401;
                                        float _1419 = _1417 + (-1.0);
                                        float _1421 = _1417 * _1403;
                                        float _1423 = _1415 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1425 = exp2(_1423);
                                        float _1427 = fma(_1419, _1425, 1.0);
                                        float _1429 = 1.0 / _1427;
                                        float _1431 = _1421 * _1429;
                                        float _1433 = fma(_1399, _1431, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1391 = _1433;
                                    }
                                    float _1435 = _1391;
                                    float _1437 = precise::max(0.0, _1435);
                                    float _1439 = precise::min(_1437, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1441 = _1439 * _1385;
                                    _1369 = _1441;
                                }
                                _1371 = false;
                                float _1443 = _1369;
                                float _1445 = precise::max(_1243, _1345);
                                float _1447 = precise::max(_1445, _1443);
                                float _1449 = -_1243;
                                float _1451 = _1447 + _1449;
                                float _1453 = -_1345;
                                float _1455 = _1447 + _1453;
                                float _1457 = -_1443;
                                float _1459 = _1447 + _1457;
                                float _1461 = fma(_1451, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1243);
                                float _1463 = fma(_1455, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1345);
                                float _1465 = fma(_1459, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1443);
                                float _1467 = _407 * _1461;
                                float _1469 = _415 * _1463;
                                float _1471 = _423 * _1465;
                                _569 = _1467;
                                _571 = _1469;
                                _579 = _1471;
                                _581 = true;
                            }
                            else
                            {
                                bool _1473 = _593 != 5.0;
                                bool _1475 = isnan(_593);
                                bool _1477 = _1473 || _1475;
                                bool _1479 = isnan(5.0);
                                bool _1481 = _1477 || _1479;
                                if (!_1481)
                                {
                                    _615 = _343;
                                }
                                float _1483 = _615;
                                float _1485 = _1483;
                                _569 = _1483;
                                if (!_1481)
                                {
                                    _617 = _345;
                                }
                                float _1487 = _617;
                                float _1489 = _1487;
                                _571 = _1487;
                                if (!_1481)
                                {
                                    _619 = _347;
                                }
                                float _1491 = _619;
                                bool _1493 = !_1481;
                                float _1495 = _1491;
                                _579 = _1491;
                                if (!_1493)
                                {
                                    bool _1497 = _593 != 6.0;
                                    bool _1499 = isnan(_593);
                                    bool _1501 = _1497 || _1499;
                                    bool _1503 = isnan(6.0);
                                    bool _1505 = _1501 || _1503;
                                    if (!_1505)
                                    {
                                        float _1507 = -_407;
                                        float _1509 = _1507 + 1.0;
                                        float _1511 = -_415;
                                        float _1513 = _1511 + 1.0;
                                        float _1515 = -_423;
                                        float _1517 = _1515 + 1.0;
                                        float _1519 = abs(_1509);
                                        float _1521 = log2(_1519);
                                        float _1523 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1525 = abs(_1513);
                                        float _1527 = log2(_1525);
                                        float _1529 = abs(_1517);
                                        float _1531 = log2(_1529);
                                        float _1533 = _1521 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1535 = _1527 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1537 = exp2(_1533);
                                        float _1539 = _1531 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1541 = exp2(_1535);
                                        float _1543 = exp2(_1539);
                                        float _1545 = fma(_1523, _1537, 1.0);
                                        float _1547 = fma(_1523, _1541, 1.0);
                                        float _1549 = 1.0 / _1545;
                                        float _1551 = fma(_1523, _1543, 1.0);
                                        float _1553 = 1.0 / _1547;
                                        float _1555 = 1.0 / _1551;
                                        float _1557 = _1549 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1559 = _1553 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1561 = precise::max(_1557, _1559);
                                        float _1563 = _1555 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1565 = precise::max(_1563, _1561);
                                        float _1567 = -_1557;
                                        float _1569 = _1567 + _1565;
                                        float _1571 = -_1559;
                                        float _1573 = _1571 + _1565;
                                        float _1575 = -_1563;
                                        float _1577 = _1575 + _1565;
                                        float _1579 = fma(_1569, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1557);
                                        float _1581 = fma(_1573, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1559);
                                        float _1583 = fma(_1577, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1563);
                                        float _1585 = _407 * _1579;
                                        float _1587 = _415 * _1581;
                                        float _1589 = _423 * _1583;
                                        _569 = _1585;
                                        _571 = _1587;
                                        _579 = _1589;
                                        _581 = true;
                                    }
                                    else
                                    {
                                        bool _1591 = _593 != 7.0;
                                        bool _1593 = isnan(_593);
                                        bool _1595 = _1591 || _1593;
                                        bool _1597 = isnan(7.0);
                                        bool _1599 = _1595 || _1597;
                                        if (_1599)
                                        {
                                            _1485 = 0.0;
                                            _1489 = 0.0;
                                        }
                                        float _1601 = _1485;
                                        float _1603 = _1489;
                                        _569 = _1601;
                                        _571 = _1603;
                                        if (_1599)
                                        {
                                            _1495 = 0.0;
                                        }
                                        float _1605 = _1495;
                                        _579 = _1605;
                                        if (!_1599)
                                        {
                                            float _1607 = -_407;
                                            float _1609 = _1607 + 1.0;
                                            float _1611 = -_415;
                                            float _1613 = _1611 + 1.0;
                                            float _1615 = -_423;
                                            float _1617 = _1615 + 1.0;
                                            float _1619 = abs(_1609);
                                            float _1621 = log2(_1619);
                                            float _1623 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1625 = abs(_1613);
                                            float _1627 = log2(_1625);
                                            float _1629 = abs(_1617);
                                            float _1631 = log2(_1629);
                                            float _1633 = _1621 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1635 = _1627 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1637 = exp2(_1633);
                                            float _1639 = _1631 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1641 = exp2(_1635);
                                            float _1643 = exp2(_1639);
                                            float _1645 = fma(_1623, _1637, 1.0);
                                            float _1647 = fma(_1623, _1641, 1.0);
                                            float _1649 = 1.0 / _1645;
                                            float _1651 = fma(_1623, _1643, 1.0);
                                            float _1653 = 1.0 / _1647;
                                            float _1655 = 1.0 / _1651;
                                            float _1657 = _1649 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1659 = -_407;
                                            float _1661 = fma(_407, _1657, _1659);
                                            float _1663 = _1653 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1665 = -_415;
                                            float _1667 = fma(_415, _1663, _1665);
                                            float _1669 = _1655 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1671 = _1661 + _1667;
                                            float _1673 = -_423;
                                            float _1675 = fma(_423, _1669, _1673);
                                            float _1677 = _1675 + _1671;
                                            float _1679 = -_1661;
                                            float _1681 = fma(_1677, 0.3333333432674407958984375, _1679);
                                            float _1683 = -_1667;
                                            float _1685 = fma(_1677, 0.3333333432674407958984375, _1683);
                                            float _1687 = -_1675;
                                            float _1689 = fma(_1677, 0.3333333432674407958984375, _1687);
                                            float _1691 = fma(_1681, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1661);
                                            float _1693 = fma(_1685, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1667);
                                            float _1695 = fma(_1689, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1675);
                                            float _1697 = _407 + _1691;
                                            float _1699 = _415 + _1693;
                                            float _1701 = _423 + _1695;
                                            _569 = _1697;
                                            _571 = _1699;
                                            _579 = _1701;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _581 = false;
        float _1703 = _569;
        float _1705 = _571;
        float _1707 = _579;
        _525 = _1703;
        _527 = _1705;
        _529 = _1707;
    }
    _531 = false;
    float _1709 = _525;
    float _1711 = _527;
    float _1713 = _529;
    float _1715 = _1709 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1717 = _1711 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1719 = _1713 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_43.x = _1715;
    out.m_43.y = _1717;
    out.m_43.z = _1719;
    out.m_43.w = _79;
    return out;
}

