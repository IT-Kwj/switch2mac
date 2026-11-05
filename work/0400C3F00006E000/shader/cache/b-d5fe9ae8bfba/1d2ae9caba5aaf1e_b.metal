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
    bool _477 = false;
    bool _527 = false;
    bool _1311 = false;
    bool _1211 = false;
    bool _1109 = false;
    bool _295 = false;
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
    float2 _1694 = float2(_66, _68);
    float4 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1694, float2(0.0), isnan(_1694))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1694, float2(0.0), isnan(_1694))).xyzw;
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
    bool _103 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    float _105 = fma(_87, _87, _89);
    float _107 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _109 = -_107;
    float _111 = fma(_109, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _113 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    bool _115 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _117 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _119 = _115 || _117;
    bool _121 = isnan(-1.0999999631167156621813774108887e-06);
    bool _123 = _119 || _121;
    float _125 = sqrt(_105);
    float _127 = precise::max(0.0, _111);
    float _129 = -_127;
    float _131 = _113 + _129;
    float _133 = 1.0 / _131;
    float _135 = -_127;
    float _137 = _125 + _135;
    float _139 = _137 * _133;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    int _144 = _123 ? 0 : 1;
    float _146 = _127;
    float _148 = _113;
    float _150 = _125;
    if (_101)
    {
        float _152 = _75 * 0.715200006961822509765625;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _154;
    if (_101)
    {
        float _158 = fma(_73, 0.2125999927520751953125, _154);
        _156 = _158;
    }
    float _160 = _156;
    if (_101)
    {
        float _162 = fma(_77, 0.072200000286102294921875, _160);
        _148 = _162;
    }
    float _164 = _148;
    float _166 = fma(_141, -2.0, 3.0);
    float _168 = _141 * _141;
    float _170 = _164;
    float _172 = _166;
    if (_101)
    {
        float _174 = 1.0 / _164;
        _170 = _174;
    }
    float _176 = _170;
    float _178 = fma(_168, _166, -0.5);
    float _180 = _178;
    if (!_101)
    {
        _172 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _182 = _172;
    float _184 = _182;
    if (_101)
    {
        float _186 = _176 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _188 = precise::clamp(_186, 0.0, 1.0);
        _150 = _188;
    }
    float _190 = _150;
    int _192 = ~_144;
    int _194 = _192 + 1;
    int _196 = _194 + 1;
    int _198 = _196;
    if (!_103)
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
    float _227 = fma(_178, _218, 0.5);
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
    float _257 = fma(_253, 6.103515625e-05, -0.3125);
    float _259 = fma(_233, 6.103515625e-05, -0.3125);
    float _261 = fma(_255, 6.103515625e-05, -0.3125);
    float _263 = fma(_257, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _265 = fma(_259, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _267 = fma(_261, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _269 = !_251;
    float _271 = as_type<float>(_225);
    float _273 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _275 = _263;
    float _277 = _263;
    float _289;
    float _291;
    float _293;
    if (!_269)
    {
        float3 _2012 = float3(_267, _265, _263);
        float3 _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2012, float3(0.0), isnan(_2012))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2012, float3(0.0), isnan(_2012))).xyz;
        float _283 = _281.x;
        float _285 = _281.y;
        float _287 = _281.z;
        _289 = _283;
        _291 = _285;
        _293 = _287;
        _295 = true;
    }
    else
    {
        float3 _2034 = float3(_267, _265, _263);
        float3 _297 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2034, float3(0.0), isnan(_2034))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2034, float3(0.0), isnan(_2034))).xyz;
        float _299 = _297.x;
        float _301 = _297.y;
        float _303 = _297.z;
        float3 _2049 = float3(_267, _265, _263);
        float3 _305 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2049, float3(0.0), isnan(_2049))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2049, float3(0.0), isnan(_2049))).xyz;
        float _307 = _305.x;
        float _309 = _305.y;
        float _311 = _305.z;
        bool _313 = _237 >= 0.001000000047497451305389404296875;
        bool _315 = isnan(_237);
        bool _317 = _313 || _315;
        bool _319 = isnan(0.001000000047497451305389404296875);
        bool _321 = _317 || _319;
        bool _323 = !_321;
        _289 = _299;
        _291 = _301;
        _293 = _303;
        _180 = _311;
        if (!_323)
        {
            float3 _2085 = float3(_267, _265, _263);
            float3 _325 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2085, float3(0.0), isnan(_2085))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2085, float3(0.0), isnan(_2085))).xyz;
            float _327 = _325.x;
            float _329 = _325.y;
            float _331 = _325.z;
            float _333 = -_307;
            float _335 = _327 + _333;
            float _337 = -_309;
            float _339 = _329 + _337;
            float _341 = -_311;
            float _343 = _331 + _341;
            float _345 = fma(_237, _335, _307);
            float _347 = fma(_237, _339, _309);
            float _349 = fma(_237, _343, _311);
            _289 = _345;
            _291 = _347;
            _293 = _349;
            _271 = _339;
            _273 = _335;
        }
    }
    _295 = false;
    float _351 = _289;
    float _353 = _291;
    float _355 = _293;
    float _357 = _180;
    float _359 = _271;
    float _361 = _273;
    bool _363 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _365 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _367 = _363 || _365;
    bool _369 = isnan(6.0);
    bool _371 = _367 || _369;
    float _373 = _357;
    float _375 = _361;
    float _377 = _359;
    float _379 = _361;
    float _381 = _351;
    float _383 = _353;
    float _385 = _355;
    float _471;
    float _473;
    float _475;
    if (!_371)
    {
        float _387 = -_351;
        float _389 = _387 + 1.0;
        float _391 = -_353;
        float _393 = _391 + 1.0;
        float _395 = -_355;
        float _397 = _395 + 1.0;
        float _399 = abs(_389);
        float _401 = log2(_399);
        float _403 = abs(_393);
        float _405 = log2(_403);
        float _407 = abs(_397);
        float _409 = log2(_407);
        float _411 = _401 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _413 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _415 = _405 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _417 = exp2(_411);
        float _419 = _409 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _421 = exp2(_415);
        float _423 = exp2(_419);
        float _425 = fma(_413, _417, 1.0);
        float _427 = fma(_413, _421, 1.0);
        float _429 = 1.0 / _425;
        float _431 = fma(_413, _423, 1.0);
        float _433 = 1.0 / _427;
        float _435 = 1.0 / _431;
        float _437 = _429 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _439 = _433 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _441 = precise::max(_437, _439);
        float _443 = _435 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _445 = precise::max(_443, _441);
        float _447 = -_437;
        float _449 = _447 + _445;
        float _451 = -_439;
        float _453 = _451 + _445;
        float _455 = -_443;
        float _457 = _455 + _445;
        float _459 = fma(_449, (*spvDescriptorSet0.fp_c3)._m0[6].w, _437);
        float _461 = fma(_453, (*spvDescriptorSet0.fp_c3)._m0[6].w, _439);
        float _463 = fma(_457, (*spvDescriptorSet0.fp_c3)._m0[6].w, _443);
        float _465 = _459 * _351;
        float _467 = _461 * _353;
        float _469 = _463 * _355;
        _471 = _465;
        _473 = _467;
        _475 = _469;
        _477 = true;
    }
    else
    {
        bool _479 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_479)
        {
            _373 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _481 = _373;
        bool _483 = !_479;
        float _485 = _481;
        float _515;
        float _517;
        float _525;
        if (!_483)
        {
            float _487 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _489 = _66 + _487;
            float _491 = abs(_489);
            float _493 = _491 * 2560.0;
            bool _495 = _493 >= 2.0;
            bool _497 = isnan(_493);
            bool _499 = _495 || _497;
            bool _501 = isnan(2.0);
            bool _503 = _499 || _501;
            float _505 = _493;
            if (!_503)
            {
                _505 = 0.0;
                _375 = 0.0;
            }
            float _507 = _505;
            float _509 = _375;
            float _511 = _507;
            float _513 = _509;
            _515 = _507;
            _517 = _509;
            if (!_503)
            {
                _275 = 0.0;
            }
            float _519 = _275;
            bool _521 = !_503;
            float _523 = _519;
            _525 = _519;
            _527 = _521;
            if (!_527)
            {
                bool _529 = _66 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_529)
                {
                    _511 = _351;
                }
                float _531 = _511;
                _377 = _531;
                _515 = _531;
                if (_529)
                {
                    _513 = _353;
                }
                float _533 = _513;
                _379 = _533;
                _517 = _533;
                if (_529)
                {
                    _523 = _355;
                }
                float _535 = _523;
                _277 = _535;
                _525 = _535;
                _527 = _529;
                if (!_527)
                {
                    float _537 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _485 = _537;
                }
            }
        }
        if (!_527)
        {
            float _539 = _485;
            float _541 = _377;
            float _543 = _379;
            float _545 = _277;
            bool _547 = _539 != 0.0;
            bool _549 = isnan(_539);
            bool _551 = _547 || _549;
            bool _553 = isnan(0.0);
            bool _555 = _551 || _553;
            float _557 = _541;
            float _559 = _541;
            float _561 = _543;
            float _563 = _545;
            if (!_555)
            {
                float _565 = _353 * 0.586600005626678466796875;
                float _567 = fma(_351, 0.29890000820159912109375, _565);
                float _569 = fma(_355, 0.1143999993801116943359375, _567);
                float _571 = _569 * (-1.44269502162933349609375);
                float _573 = exp2(_571);
                float _575 = -_573;
                float _577 = _575 + 1.0;
                bool _579 = _577 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _581 = isnan(_577);
                bool _583 = _579 || _581;
                bool _585 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _587 = _583 || _585;
                float _589 = _567;
                if (!_587)
                {
                    _589 = _577;
                }
                float _591 = _589;
                bool _593 = !_587;
                float _595 = _591;
                if (!_593)
                {
                    float _597 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _599 = _577 + _597;
                    float _601 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _603 = spvFAdd(_601, 1.00000095367431640625);
                    float _605 = 1.0 / _603;
                    float _607 = _599 * _605;
                    float _609 = -_607;
                    float _611 = _609 + 1.0;
                    float _613 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _615 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _613;
                    float _617 = abs(_611);
                    float _619 = log2(_617);
                    float _621 = _615 * _605;
                    float _623 = _621 + (-1.0);
                    float _625 = _621 * _607;
                    float _627 = _619 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _629 = exp2(_627);
                    float _631 = fma(_623, _629, 1.0);
                    float _633 = 1.0 / _631;
                    float _635 = _625 * _633;
                    float _637 = fma(_603, _635, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _595 = _637;
                }
                float _639 = _595;
                float _641 = -_577;
                float _643 = _641 + _639;
                float _645 = spvFAdd(_569, 9.9999999747524270787835121154785e-07);
                float _647 = _643 + 1.0;
                float _649 = 1.0 / _645;
                float _651 = abs(_647);
                float _653 = log2(_651);
                float _655 = fma(_649, _351, -1.0);
                float _657 = fma(_649, _353, -1.0);
                float _659 = fma(_649, _355, -1.0);
                float _661 = _653 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _663 = exp2(_661);
                float _665 = fma(_663, _655, 1.0);
                float _667 = fma(_663, _657, 1.0);
                float _669 = fma(_663, _659, 1.0);
                float _671 = _665 * _639;
                float _673 = _667 * _639;
                float _675 = _669 * _639;
                float _677 = precise::max(0.0, _671);
                float _679 = precise::max(0.0, _673);
                float _681 = precise::max(0.0, _675);
                float _683 = precise::min(_677, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _685 = precise::min(_679, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _687 = precise::min(_681, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _515 = _683;
                _517 = _685;
                _525 = _687;
                _527 = true;
            }
            else
            {
                bool _689 = _539 != 1.0;
                bool _691 = isnan(_539);
                bool _693 = _689 || _691;
                bool _695 = isnan(1.0);
                bool _697 = _693 || _695;
                if (!_697)
                {
                    bool _699 = _351 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _701 = isnan(_351);
                    bool _703 = _699 || _701;
                    bool _705 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _707 = _703 || _705;
                    float _709 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _711 = spvFAdd(_709, 1.00000095367431640625);
                    bool _713 = _353 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _715 = isnan(_353);
                    bool _717 = _713 || _715;
                    bool _719 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _721 = _717 || _719;
                    bool _723 = _355 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _725 = isnan(_355);
                    bool _727 = _723 || _725;
                    bool _729 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _731 = _727 || _729;
                    float _733 = 1.0 / _711;
                    float _735 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _737 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _735;
                    float _739 = _737 * _733;
                    bool _741 = !_707;
                    if (!_741)
                    {
                        float _743 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _745 = _351 + _743;
                        float _747 = _739 + (-1.0);
                        float _749 = _745 * _733;
                        float _751 = -_749;
                        float _753 = _751 + 1.0;
                        float _755 = _739 * _749;
                        float _757 = abs(_753);
                        float _759 = log2(_757);
                        float _761 = _759 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _763 = exp2(_761);
                        float _765 = fma(_747, _763, 1.0);
                        float _767 = 1.0 / _765;
                        float _769 = _755 * _767;
                        float _771 = fma(_711, _769, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _381 = _771;
                    }
                    float _773 = _381;
                    bool _775 = !_721;
                    if (!_775)
                    {
                        float _777 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _779 = _353 + _777;
                        float _781 = _739 + (-1.0);
                        float _783 = _779 * _733;
                        float _785 = -_783;
                        float _787 = _785 + 1.0;
                        float _789 = _739 * _783;
                        float _791 = abs(_787);
                        float _793 = log2(_791);
                        float _795 = _793 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _797 = exp2(_795);
                        float _799 = fma(_781, _797, 1.0);
                        float _801 = 1.0 / _799;
                        float _803 = _789 * _801;
                        float _805 = fma(_711, _803, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _383 = _805;
                    }
                    float _807 = _383;
                    bool _809 = !_731;
                    if (!_809)
                    {
                        float _811 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _813 = _355 + _811;
                        float _815 = _739 + (-1.0);
                        float _817 = _813 * _733;
                        float _819 = -_817;
                        float _821 = _819 + 1.0;
                        float _823 = _739 * _817;
                        float _825 = abs(_821);
                        float _827 = log2(_825);
                        float _829 = _827 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _831 = exp2(_829);
                        float _833 = fma(_815, _831, 1.0);
                        float _835 = 1.0 / _833;
                        float _837 = _823 * _835;
                        float _839 = fma(_711, _837, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _385 = _839;
                    }
                    float _841 = _385;
                    float _843 = precise::max(0.0, _841);
                    float _845 = precise::max(0.0, _773);
                    float _847 = precise::max(0.0, _807);
                    float _849 = precise::min(_843, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _851 = precise::min(_845, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _853 = precise::min(_847, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _515 = _851;
                    _517 = _853;
                    _525 = _849;
                    _527 = true;
                }
                else
                {
                    bool _855 = _539 != 2.0;
                    bool _857 = isnan(_539);
                    bool _859 = _855 || _857;
                    bool _861 = isnan(2.0);
                    bool _863 = _859 || _861;
                    if (!_863)
                    {
                        float _865 = _353 * 0.715200006961822509765625;
                        float _867 = fma(_351, 0.2125999927520751953125, _865);
                        float _869 = fma(_355, 0.072200000286102294921875, _867);
                        float _871 = spvFAdd(_869, 9.9999999747524270787835121154785e-07);
                        bool _873 = _869 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _875 = isnan(_869);
                        bool _877 = _873 || _875;
                        bool _879 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _881 = _877 || _879;
                        float _883 = 1.0 / _871;
                        bool _885 = !_881;
                        float _887 = _869;
                        if (!_885)
                        {
                            float _889 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _891 = _869 + _889;
                            float _893 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _895 = spvFAdd(_893, 1.00000095367431640625);
                            float _897 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _899 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _897;
                            float _901 = 1.0 / _895;
                            float _903 = _891 * _901;
                            float _905 = _899 * _901;
                            float _907 = -_903;
                            float _909 = _907 + 1.0;
                            float _911 = _905 + (-1.0);
                            float _913 = _905 * _903;
                            float _915 = abs(_909);
                            float _917 = log2(_915);
                            float _919 = _917 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _921 = exp2(_919);
                            float _923 = fma(_911, _921, 1.0);
                            float _925 = 1.0 / _923;
                            float _927 = _913 * _925;
                            float _929 = fma(_895, _927, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _887 = _929;
                        }
                        float _931 = _887;
                        float _933 = precise::max(0.0, _931);
                        float _935 = precise::min(_933, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _937 = _935 * _883;
                        float _939 = _351 * _937;
                        float _941 = _353 * _937;
                        float _943 = _355 * _937;
                        float _945 = precise::max(0.0, _939);
                        float _947 = precise::max(0.0, _941);
                        float _949 = precise::max(0.0, _943);
                        float _951 = precise::min(_945, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _953 = precise::min(_947, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _955 = precise::min(_949, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _515 = _951;
                        _517 = _953;
                        _525 = _955;
                        _527 = true;
                    }
                    else
                    {
                        bool _957 = _539 != 3.0;
                        bool _959 = isnan(_539);
                        bool _961 = _957 || _959;
                        bool _963 = isnan(3.0);
                        bool _965 = _961 || _963;
                        if (!_965)
                        {
                            float _967 = -_351;
                            float _969 = _967 + 1.0;
                            float _971 = -_353;
                            float _973 = _971 + 1.0;
                            float _975 = -_355;
                            float _977 = _975 + 1.0;
                            float _979 = abs(_969);
                            float _981 = log2(_979);
                            float _983 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _985 = abs(_973);
                            float _987 = log2(_985);
                            float _989 = abs(_977);
                            float _991 = log2(_989);
                            float _993 = _981 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _995 = _987 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _997 = exp2(_993);
                            float _999 = _991 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1001 = exp2(_995);
                            float _1003 = exp2(_999);
                            float _1005 = fma(_983, _997, 1.0);
                            float _1007 = fma(_983, _1001, 1.0);
                            float _1009 = 1.0 / _1005;
                            float _1011 = fma(_983, _1003, 1.0);
                            float _1013 = 1.0 / _1007;
                            float _1015 = 1.0 / _1011;
                            float _1017 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1019 = _1009 + _1013;
                            float _1021 = _1013 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1023 = _1015 + _1019;
                            float _1025 = _1015 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1027 = precise::max(_1017, _1021);
                            float _1029 = _1023 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1031 = precise::max(_1025, _1027);
                            float _1033 = _1029 * 0.3333333432674407958984375;
                            float _1035 = -_1033;
                            float _1037 = _1031 + _1035;
                            float _1039 = fma(_1037, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1033);
                            float _1041 = -_1017;
                            float _1043 = _1041 + _1039;
                            float _1045 = -_1021;
                            float _1047 = _1045 + _1039;
                            float _1049 = -_1025;
                            float _1051 = _1049 + _1039;
                            float _1053 = fma(_1043, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1017);
                            float _1055 = fma(_1047, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1021);
                            float _1057 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1025);
                            float _1059 = _1053 * _351;
                            float _1061 = _1055 * _353;
                            float _1063 = _1057 * _355;
                            _515 = _1059;
                            _517 = _1061;
                            _525 = _1063;
                            _527 = true;
                        }
                        else
                        {
                            bool _1065 = _539 != 4.0;
                            bool _1067 = isnan(_539);
                            bool _1069 = _1065 || _1067;
                            bool _1071 = isnan(4.0);
                            bool _1073 = _1069 || _1071;
                            if (!_1073)
                            {
                                bool _1075 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1077 = isnan(0.0);
                                bool _1079 = _1075 || _1077;
                                bool _1081 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1083 = _1079 || _1081;
                                float _1105;
                                float _1107;
                                if (!_1083)
                                {
                                    float _1085 = -_351;
                                    float _1087 = _1085 + 1.0;
                                    float _1089 = abs(_1087);
                                    float _1091 = log2(_1089);
                                    float _1093 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1095 = _1091 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1097 = exp2(_1095);
                                    float _1099 = fma(_1093, _1097, 1.0);
                                    float _1101 = 1.0 / _1099;
                                    float _1103 = _1101 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1105 = _1091;
                                    _1107 = _1103;
                                    _1109 = true;
                                }
                                else
                                {
                                    float _1111 = spvFAdd(_351, 9.9999999747524270787835121154785e-07);
                                    bool _1113 = _351 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1115 = isnan(_351);
                                    bool _1117 = _1113 || _1115;
                                    bool _1119 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1121 = _1117 || _1119;
                                    float _1123 = 1.0 / _1111;
                                    if (!_1121)
                                    {
                                        _557 = _351;
                                    }
                                    float _1125 = _557;
                                    bool _1127 = !_1121;
                                    float _1129 = _1125;
                                    _1105 = _1123;
                                    if (!_1127)
                                    {
                                        float _1131 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1133 = _351 + _1131;
                                        float _1135 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1137 = spvFAdd(_1135, 1.00000095367431640625);
                                        float _1139 = 1.0 / _1137;
                                        float _1141 = _1133 * _1139;
                                        float _1143 = -_1141;
                                        float _1145 = _1143 + 1.0;
                                        float _1147 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1149 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1147;
                                        float _1151 = abs(_1145);
                                        float _1153 = log2(_1151);
                                        float _1155 = _1149 * _1139;
                                        float _1157 = _1155 + (-1.0);
                                        float _1159 = _1155 * _1141;
                                        float _1161 = _1153 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1163 = exp2(_1161);
                                        float _1165 = fma(_1157, _1163, 1.0);
                                        float _1167 = 1.0 / _1165;
                                        float _1169 = _1159 * _1167;
                                        float _1171 = fma(_1137, _1169, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1129 = _1171;
                                    }
                                    float _1173 = _1129;
                                    float _1175 = precise::max(0.0, _1173);
                                    float _1177 = precise::min(_1175, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1179 = _1177 * _1123;
                                    _1107 = _1179;
                                }
                                _1109 = false;
                                float _1181 = _1105;
                                float _1183 = _1107;
                                float _1185 = _1181;
                                float _1207;
                                float _1209;
                                if (!_1083)
                                {
                                    float _1187 = -_353;
                                    float _1189 = _1187 + 1.0;
                                    float _1191 = abs(_1189);
                                    float _1193 = log2(_1191);
                                    float _1195 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1197 = _1193 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1199 = exp2(_1197);
                                    float _1201 = fma(_1195, _1199, 1.0);
                                    float _1203 = 1.0 / _1201;
                                    float _1205 = _1203 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1207 = _1193;
                                    _1209 = _1205;
                                    _1211 = true;
                                }
                                else
                                {
                                    float _1213 = spvFAdd(_353, 9.9999999747524270787835121154785e-07);
                                    bool _1215 = _353 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1217 = isnan(_353);
                                    bool _1219 = _1215 || _1217;
                                    bool _1221 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1223 = _1219 || _1221;
                                    float _1225 = 1.0 / _1213;
                                    if (!_1223)
                                    {
                                        _1185 = _353;
                                    }
                                    float _1227 = _1185;
                                    bool _1229 = !_1223;
                                    float _1231 = _1227;
                                    _1207 = _1225;
                                    if (!_1229)
                                    {
                                        float _1233 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1235 = _353 + _1233;
                                        float _1237 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1239 = spvFAdd(_1237, 1.00000095367431640625);
                                        float _1241 = 1.0 / _1239;
                                        float _1243 = _1235 * _1241;
                                        float _1245 = -_1243;
                                        float _1247 = _1245 + 1.0;
                                        float _1249 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1251 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1249;
                                        float _1253 = abs(_1247);
                                        float _1255 = log2(_1253);
                                        float _1257 = _1251 * _1241;
                                        float _1259 = _1257 + (-1.0);
                                        float _1261 = _1257 * _1243;
                                        float _1263 = _1255 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1265 = exp2(_1263);
                                        float _1267 = fma(_1259, _1265, 1.0);
                                        float _1269 = 1.0 / _1267;
                                        float _1271 = _1261 * _1269;
                                        float _1273 = fma(_1239, _1271, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1231 = _1273;
                                    }
                                    float _1275 = _1231;
                                    float _1277 = precise::max(0.0, _1275);
                                    float _1279 = precise::min(_1277, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1281 = _1279 * _1225;
                                    _1209 = _1281;
                                }
                                _1211 = false;
                                float _1283 = _1207;
                                float _1285 = _1209;
                                float _1287 = _1283;
                                float _1309;
                                if (!_1083)
                                {
                                    float _1289 = -_355;
                                    float _1291 = _1289 + 1.0;
                                    float _1293 = abs(_1291);
                                    float _1295 = log2(_1293);
                                    float _1297 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1299 = _1295 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1301 = exp2(_1299);
                                    float _1303 = fma(_1297, _1301, 1.0);
                                    float _1305 = 1.0 / _1303;
                                    float _1307 = _1305 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1309 = _1307;
                                    _1311 = true;
                                }
                                else
                                {
                                    float _1313 = spvFAdd(_355, 9.9999999747524270787835121154785e-07);
                                    bool _1315 = _355 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1317 = isnan(_355);
                                    bool _1319 = _1315 || _1317;
                                    bool _1321 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1323 = _1319 || _1321;
                                    float _1325 = 1.0 / _1313;
                                    if (!_1323)
                                    {
                                        _1287 = _355;
                                    }
                                    float _1327 = _1287;
                                    bool _1329 = !_1323;
                                    float _1331 = _1327;
                                    if (!_1329)
                                    {
                                        float _1333 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1335 = _355 + _1333;
                                        float _1337 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1339 = spvFAdd(_1337, 1.00000095367431640625);
                                        float _1341 = 1.0 / _1339;
                                        float _1343 = _1335 * _1341;
                                        float _1345 = -_1343;
                                        float _1347 = _1345 + 1.0;
                                        float _1349 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1351 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1349;
                                        float _1353 = abs(_1347);
                                        float _1355 = log2(_1353);
                                        float _1357 = _1351 * _1341;
                                        float _1359 = _1357 + (-1.0);
                                        float _1361 = _1357 * _1343;
                                        float _1363 = _1355 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1365 = exp2(_1363);
                                        float _1367 = fma(_1359, _1365, 1.0);
                                        float _1369 = 1.0 / _1367;
                                        float _1371 = _1361 * _1369;
                                        float _1373 = fma(_1339, _1371, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1331 = _1373;
                                    }
                                    float _1375 = _1331;
                                    float _1377 = precise::max(0.0, _1375);
                                    float _1379 = precise::min(_1377, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1381 = _1379 * _1325;
                                    _1309 = _1381;
                                }
                                _1311 = false;
                                float _1383 = _1309;
                                float _1385 = precise::max(_1183, _1285);
                                float _1387 = precise::max(_1385, _1383);
                                float _1389 = -_1183;
                                float _1391 = _1387 + _1389;
                                float _1393 = -_1285;
                                float _1395 = _1387 + _1393;
                                float _1397 = -_1383;
                                float _1399 = _1387 + _1397;
                                float _1401 = fma(_1391, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1183);
                                float _1403 = fma(_1395, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1285);
                                float _1405 = fma(_1399, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1383);
                                float _1407 = _1401 * _351;
                                float _1409 = _1403 * _353;
                                float _1411 = _1405 * _355;
                                _515 = _1407;
                                _517 = _1409;
                                _525 = _1411;
                                _527 = true;
                            }
                            else
                            {
                                bool _1413 = _539 != 5.0;
                                bool _1415 = isnan(_539);
                                bool _1417 = _1413 || _1415;
                                bool _1419 = isnan(5.0);
                                bool _1421 = _1417 || _1419;
                                if (!_1421)
                                {
                                    _559 = _351;
                                }
                                float _1423 = _559;
                                float _1425 = _1423;
                                _515 = _1423;
                                if (!_1421)
                                {
                                    _561 = _353;
                                }
                                float _1427 = _561;
                                float _1429 = _1427;
                                _517 = _1427;
                                if (!_1421)
                                {
                                    _563 = _355;
                                }
                                float _1431 = _563;
                                bool _1433 = !_1421;
                                float _1435 = _1431;
                                _525 = _1431;
                                if (!_1433)
                                {
                                    bool _1437 = _539 != 6.0;
                                    bool _1439 = isnan(_539);
                                    bool _1441 = _1437 || _1439;
                                    bool _1443 = isnan(6.0);
                                    bool _1445 = _1441 || _1443;
                                    if (!_1445)
                                    {
                                        float _1447 = -_351;
                                        float _1449 = _1447 + 1.0;
                                        float _1451 = -_353;
                                        float _1453 = _1451 + 1.0;
                                        float _1455 = -_355;
                                        float _1457 = _1455 + 1.0;
                                        float _1459 = abs(_1449);
                                        float _1461 = log2(_1459);
                                        float _1463 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1465 = abs(_1453);
                                        float _1467 = log2(_1465);
                                        float _1469 = abs(_1457);
                                        float _1471 = log2(_1469);
                                        float _1473 = _1461 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1475 = _1467 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1477 = exp2(_1473);
                                        float _1479 = _1471 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1481 = exp2(_1475);
                                        float _1483 = exp2(_1479);
                                        float _1485 = fma(_1463, _1477, 1.0);
                                        float _1487 = fma(_1463, _1481, 1.0);
                                        float _1489 = 1.0 / _1485;
                                        float _1491 = fma(_1463, _1483, 1.0);
                                        float _1493 = 1.0 / _1487;
                                        float _1495 = 1.0 / _1491;
                                        float _1497 = _1489 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1499 = _1493 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1501 = precise::max(_1497, _1499);
                                        float _1503 = _1495 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1505 = precise::max(_1503, _1501);
                                        float _1507 = -_1497;
                                        float _1509 = _1507 + _1505;
                                        float _1511 = -_1499;
                                        float _1513 = _1511 + _1505;
                                        float _1515 = -_1503;
                                        float _1517 = _1515 + _1505;
                                        float _1519 = fma(_1509, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1497);
                                        float _1521 = fma(_1513, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1499);
                                        float _1523 = fma(_1517, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1503);
                                        float _1525 = _1519 * _351;
                                        float _1527 = _1521 * _353;
                                        float _1529 = _1523 * _355;
                                        _515 = _1525;
                                        _517 = _1527;
                                        _525 = _1529;
                                        _527 = true;
                                    }
                                    else
                                    {
                                        bool _1531 = _539 != 7.0;
                                        bool _1533 = isnan(_539);
                                        bool _1535 = _1531 || _1533;
                                        bool _1537 = isnan(7.0);
                                        bool _1539 = _1535 || _1537;
                                        if (_1539)
                                        {
                                            _1425 = 0.0;
                                            _1429 = 0.0;
                                        }
                                        float _1541 = _1425;
                                        float _1543 = _1429;
                                        _515 = _1541;
                                        _517 = _1543;
                                        if (_1539)
                                        {
                                            _1435 = 0.0;
                                        }
                                        float _1545 = _1435;
                                        _525 = _1545;
                                        if (!_1539)
                                        {
                                            float _1547 = -_351;
                                            float _1549 = _1547 + 1.0;
                                            float _1551 = -_353;
                                            float _1553 = _1551 + 1.0;
                                            float _1555 = -_355;
                                            float _1557 = _1555 + 1.0;
                                            float _1559 = abs(_1549);
                                            float _1561 = log2(_1559);
                                            float _1563 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1565 = abs(_1553);
                                            float _1567 = log2(_1565);
                                            float _1569 = abs(_1557);
                                            float _1571 = log2(_1569);
                                            float _1573 = _1561 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1575 = _1567 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1577 = exp2(_1573);
                                            float _1579 = _1571 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1581 = exp2(_1575);
                                            float _1583 = exp2(_1579);
                                            float _1585 = fma(_1563, _1577, 1.0);
                                            float _1587 = fma(_1563, _1581, 1.0);
                                            float _1589 = 1.0 / _1585;
                                            float _1591 = fma(_1563, _1583, 1.0);
                                            float _1593 = 1.0 / _1587;
                                            float _1595 = 1.0 / _1591;
                                            float _1597 = _1589 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1599 = -_351;
                                            float _1601 = fma(_1597, _351, _1599);
                                            float _1603 = _1593 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1605 = -_353;
                                            float _1607 = fma(_1603, _353, _1605);
                                            float _1609 = _1595 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1611 = _1601 + _1607;
                                            float _1613 = -_355;
                                            float _1615 = fma(_1609, _355, _1613);
                                            float _1617 = _1615 + _1611;
                                            float _1619 = -_1601;
                                            float _1621 = fma(_1617, 0.3333333432674407958984375, _1619);
                                            float _1623 = -_1607;
                                            float _1625 = fma(_1617, 0.3333333432674407958984375, _1623);
                                            float _1627 = -_1615;
                                            float _1629 = fma(_1617, 0.3333333432674407958984375, _1627);
                                            float _1631 = fma(_1621, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1601);
                                            float _1633 = fma(_1625, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1607);
                                            float _1635 = fma(_1629, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1615);
                                            float _1637 = _1631 + _351;
                                            float _1639 = _1633 + _353;
                                            float _1641 = _1635 + _355;
                                            _515 = _1637;
                                            _517 = _1639;
                                            _525 = _1641;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _527 = false;
        float _1643 = _515;
        float _1645 = _517;
        float _1647 = _525;
        _471 = _1643;
        _473 = _1645;
        _475 = _1647;
    }
    _477 = false;
    float _1649 = _471;
    float _1651 = _473;
    float _1653 = _475;
    float _1655 = _1649 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1657 = _1651 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1659 = _1653 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_43.x = _1655;
    out.m_43.y = _1657;
    out.m_43.z = _1659;
    out.m_43.w = _79;
    return out;
}

