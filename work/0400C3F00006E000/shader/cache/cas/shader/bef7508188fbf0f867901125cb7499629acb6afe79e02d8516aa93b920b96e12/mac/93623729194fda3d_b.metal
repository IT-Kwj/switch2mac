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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
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
    bool _473 = false;
    bool _525 = false;
    bool _1315 = false;
    bool _1215 = false;
    bool _1113 = false;
    bool _211 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_40.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_40.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _1698 = float2(_68, _66);
    float4 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1698, float2(0.0), isnan(_1698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1698, float2(0.0), isnan(_1698))).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    bool _83 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _91 = _87 || _89;
    float _93 = 0.0;
    float _95 = _56;
    float _97 = _64;
    if (_91)
    {
        float _99 = _75 * 0.715200006961822509765625;
        _93 = _99;
    }
    float _101 = _93;
    float _103 = _101;
    if (_91)
    {
        float _105 = fma(_73, 0.2125999927520751953125, _101);
        _103 = _105;
    }
    float _107 = _103;
    float _109 = _107;
    if (_91)
    {
        float _111 = fma(_77, 0.072200000286102294921875, _107);
        _95 = _111;
    }
    float _113 = _95;
    if (!_91)
    {
        _109 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _115 = _109;
    float _117 = _113;
    float _119 = _115;
    if (_91)
    {
        float _121 = 1.0 / _113;
        _117 = _121;
    }
    float _123 = _117;
    if (_91)
    {
        float _125 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _127 = precise::clamp(_125, 0.0, 1.0);
        _97 = _127;
    }
    float _129 = _97;
    if (_91)
    {
        float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _119 = _131;
    }
    float _133 = _119;
    float _135 = _73 * _133;
    float _137 = _135 * 4.0;
    float _139 = _75 * _133;
    float _141 = _139 * 4.0;
    float _143 = _77 * _133;
    float _145 = _143 * 4.0;
    uint _148 = as_type<uint>(half2(float2(_137, _141)));
    uint _150 = extract_bits(_148, 16u, 16u);
    float _152 = float(_150);
    uint _154 = as_type<uint>(half2(float2(_145, 0.0)));
    bool _156 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
    uint _158 = extract_bits(_154, 0u, 8u);
    int _161 = int(_158) & 255;
    uint _163 = extract_bits(_154, 8u, 8u);
    int _165 = int(_163) & 255;
    int _167 = _165 << 8;
    int _169 = _161 | _167;
    int _171 = int(_148) & 32767;
    float _173 = float(uint(_169));
    float _175 = float(uint(_171));
    float _177 = fma(_173, 6.103515625e-05, -0.3125);
    float _179 = fma(_152, 6.103515625e-05, -0.3125);
    float _181 = fma(_175, 6.103515625e-05, -0.3125);
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _185 = fma(_177, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _187 = fma(_181, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _189 = !_156;
    float _191 = _177;
    float _193 = _181;
    float _205;
    float _207;
    float _209;
    if (!_189)
    {
        float3 _1897 = float3(_187, _183, _185);
        float3 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1897, float3(0.0), isnan(_1897))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1897, float3(0.0), isnan(_1897))).xyz;
        float _199 = _197.x;
        float _201 = _197.y;
        float _203 = _197.z;
        _205 = _199;
        _207 = _201;
        _209 = _203;
        _211 = true;
    }
    else
    {
        bool _213 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
        bool _215 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
        bool _217 = _213 || _215;
        bool _219 = isnan(0.001000000047497451305389404296875);
        bool _221 = _217 || _219;
        float3 _1933 = float3(_187, _183, _185);
        float3 _223 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1933, float3(0.0), isnan(_1933))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1933, float3(0.0), isnan(_1933))).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        float _231 = 0.0;
        float _233 = 0.0;
        float _235 = 6.103515625e-05;
        float _237 = _225;
        float _239 = _227;
        _209 = _229;
        if (_221)
        {
            float3 _1953 = float3(_187, _183, _185);
            float3 _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1953, float3(0.0), isnan(_1953))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1953, float3(0.0), isnan(_1953))).xyz;
            float _243 = _241.x;
            float _245 = _241.y;
            float _247 = _241.z;
            _231 = _243;
            _233 = _245;
            _235 = _247;
        }
        float _249 = _231;
        float _251 = _233;
        float _253 = _235;
        float _255 = _253;
        if (_221)
        {
            float _257 = -_225;
            float _259 = _257 + _249;
            _191 = _259;
        }
        float _261 = _191;
        if (_221)
        {
            float _263 = -_227;
            float _265 = _263 + _251;
            _193 = _265;
        }
        float _267 = _193;
        if (_221)
        {
            float _269 = -_229;
            float _271 = _269 + _253;
            _255 = _271;
        }
        float _273 = _255;
        if (_221)
        {
            float _275 = fma(_261, (*spvDescriptorSet0.fp_c4)._m0[5].z, _225);
            _237 = _275;
        }
        float _277 = _237;
        _205 = _277;
        if (_221)
        {
            float _279 = fma(_267, (*spvDescriptorSet0.fp_c4)._m0[5].z, _227);
            _239 = _279;
        }
        float _281 = _239;
        _207 = _281;
        if (_221)
        {
            float _283 = fma(_273, (*spvDescriptorSet0.fp_c4)._m0[5].z, _229);
            _209 = _283;
        }
    }
    _211 = false;
    float _285 = _205;
    float _287 = _207;
    float _289 = _209;
    bool _291 = _285 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _299 = _295 || _297;
    float _301 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _303 = fma(_287, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _305 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _307 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _309 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _311 = _307 || _309;
    bool _313 = isnan(6.0);
    bool _315 = _311 || _313;
    bool _317 = _287 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _319 = isnan(_287);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _325 = _321 || _323;
    float _327 = exp2(_301);
    bool _329 = _289 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _331 = isnan(_289);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _337 = _333 || _335;
    float _339 = exp2(_303);
    float _341 = exp2(_305);
    float _343 = -_327;
    float _345 = _343 + 1.0;
    bool _347 = !_299;
    float _349 = _347 ? _285 : _345;
    float _351 = -_339;
    float _353 = _351 + 1.0;
    bool _355 = !_325;
    float _357 = _355 ? _287 : _353;
    float _359 = -_341;
    float _361 = _359 + 1.0;
    bool _363 = !_337;
    float _365 = _363 ? _289 : _361;
    float _367 = _339;
    float _369 = _341;
    float _371 = _361;
    float _373 = _339;
    float _375 = _341;
    float _377 = _349;
    float _379 = _357;
    float _381 = _365;
    float _467;
    float _469;
    float _471;
    if (!_315)
    {
        float _383 = -_349;
        float _385 = _383 + 1.0;
        float _387 = -_357;
        float _389 = _387 + 1.0;
        float _391 = -_365;
        float _393 = _391 + 1.0;
        float _395 = abs(_385);
        float _397 = log2(_395);
        float _399 = abs(_389);
        float _401 = log2(_399);
        float _403 = abs(_393);
        float _405 = log2(_403);
        float _407 = _397 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _409 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _411 = _401 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _413 = exp2(_407);
        float _415 = _405 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _417 = exp2(_411);
        float _419 = exp2(_415);
        float _421 = fma(_409, _413, 1.0);
        float _423 = fma(_409, _417, 1.0);
        float _425 = 1.0 / _421;
        float _427 = fma(_409, _419, 1.0);
        float _429 = 1.0 / _423;
        float _431 = 1.0 / _427;
        float _433 = _425 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _435 = _429 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _437 = precise::max(_433, _435);
        float _439 = _431 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _441 = precise::max(_439, _437);
        float _443 = -_433;
        float _445 = _443 + _441;
        float _447 = -_435;
        float _449 = _447 + _441;
        float _451 = -_439;
        float _453 = _451 + _441;
        float _455 = fma(_445, (*spvDescriptorSet0.fp_c3)._m0[6].w, _433);
        float _457 = fma(_449, (*spvDescriptorSet0.fp_c3)._m0[6].w, _435);
        float _459 = fma(_453, (*spvDescriptorSet0.fp_c3)._m0[6].w, _439);
        float _461 = _349 * _455;
        float _463 = _357 * _457;
        float _465 = _365 * _459;
        _467 = _461;
        _469 = _463;
        _471 = _465;
        _473 = true;
    }
    else
    {
        bool _475 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        float _477 = 0.0;
        if (!_475)
        {
            _477 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _479 = _477;
        bool _481 = !_475;
        float _483 = _479;
        float _513;
        float _515;
        float _523;
        if (!_481)
        {
            float _485 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _487 = _68 + _485;
            float _489 = abs(_487);
            float _491 = _489 * 2560.0;
            bool _493 = _491 >= 2.0;
            bool _495 = isnan(_491);
            bool _497 = _493 || _495;
            bool _499 = isnan(2.0);
            bool _501 = _497 || _499;
            float _503 = _491;
            if (!_501)
            {
                _503 = 0.0;
                _367 = 0.0;
            }
            float _505 = _503;
            float _507 = _367;
            float _509 = _505;
            float _511 = _507;
            _513 = _505;
            _515 = _507;
            if (!_501)
            {
                _369 = 0.0;
            }
            float _517 = _369;
            bool _519 = !_501;
            float _521 = _517;
            _523 = _517;
            _525 = _519;
            if (!_525)
            {
                bool _527 = _68 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_527)
                {
                    _509 = _349;
                }
                float _529 = _509;
                _371 = _529;
                _513 = _529;
                if (_527)
                {
                    _511 = _357;
                }
                float _531 = _511;
                _373 = _531;
                _515 = _531;
                if (_527)
                {
                    _521 = _365;
                }
                float _533 = _521;
                _375 = _533;
                _523 = _533;
                _525 = _527;
                if (!_525)
                {
                    float _535 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _483 = _535;
                }
            }
        }
        if (!_525)
        {
            float _537 = _483;
            float _539 = _371;
            float _541 = _373;
            float _543 = _375;
            bool _545 = _537 != 0.0;
            bool _547 = isnan(_537);
            bool _549 = _545 || _547;
            bool _551 = isnan(0.0);
            bool _553 = _549 || _551;
            float _555 = _539;
            float _557 = _539;
            float _559 = _539;
            float _561 = _541;
            float _563 = _543;
            if (!_553)
            {
                float _565 = _287 * 0.586600005626678466796875;
                float _567 = fma(_285, 0.29890000820159912109375, _565);
                float _569 = fma(_289, 0.1143999993801116943359375, _567);
                float _571 = _569 * (-1.44269502162933349609375);
                float _573 = exp2(_571);
                float _575 = -_573;
                float _577 = _575 + 1.0;
                bool _579 = _577 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _581 = isnan(_577);
                bool _583 = _579 || _581;
                bool _585 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _587 = _583 || _585;
                if (!_587)
                {
                    _555 = _577;
                }
                float _589 = _555;
                bool _591 = !_587;
                float _593 = _589;
                if (!_591)
                {
                    float _595 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _597 = _577 + _595;
                    float _599 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _601 = spvFAdd(_599, 1.00000095367431640625);
                    float _603 = 1.0 / _601;
                    float _605 = _597 * _603;
                    float _607 = -_605;
                    float _609 = _607 + 1.0;
                    float _611 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _613 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _611;
                    float _615 = abs(_609);
                    float _617 = log2(_615);
                    float _619 = _613 * _603;
                    float _621 = _619 + (-1.0);
                    float _623 = _619 * _605;
                    float _625 = _617 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _627 = exp2(_625);
                    float _629 = fma(_621, _627, 1.0);
                    float _631 = 1.0 / _629;
                    float _633 = _623 * _631;
                    float _635 = fma(_601, _633, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _593 = _635;
                }
                float _637 = _593;
                float _639 = -_577;
                float _641 = _639 + _637;
                float _643 = _357 * 0.586600005626678466796875;
                float _645 = _641 + 1.0;
                float _647 = fma(_349, 0.29890000820159912109375, _643);
                float _649 = fma(_365, 0.1143999993801116943359375, _647);
                float _651 = abs(_645);
                float _653 = log2(_651);
                float _655 = spvFAdd(_649, 9.9999999747524270787835121154785e-07);
                float _657 = 1.0 / _655;
                float _659 = _653 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _661 = exp2(_659);
                float _663 = fma(_349, _657, -1.0);
                float _665 = fma(_357, _657, -1.0);
                float _667 = fma(_365, _657, -1.0);
                float _669 = fma(_661, _663, 1.0);
                float _671 = fma(_661, _665, 1.0);
                float _673 = fma(_661, _667, 1.0);
                float _675 = _669 * _637;
                float _677 = _671 * _637;
                float _679 = _673 * _637;
                float _681 = precise::max(0.0, _675);
                float _683 = precise::max(0.0, _677);
                float _685 = precise::max(0.0, _679);
                float _687 = precise::min(_681, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _689 = precise::min(_683, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _691 = precise::min(_685, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _513 = _687;
                _515 = _689;
                _523 = _691;
                _525 = true;
            }
            else
            {
                bool _693 = _537 != 1.0;
                bool _695 = isnan(_537);
                bool _697 = _693 || _695;
                bool _699 = isnan(1.0);
                bool _701 = _697 || _699;
                if (!_701)
                {
                    bool _703 = _349 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _705 = isnan(_349);
                    bool _707 = _703 || _705;
                    bool _709 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _711 = _707 || _709;
                    float _713 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _715 = spvFAdd(_713, 1.00000095367431640625);
                    bool _717 = _357 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _719 = isnan(_357);
                    bool _721 = _717 || _719;
                    bool _723 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _725 = _721 || _723;
                    bool _727 = _365 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _729 = isnan(_365);
                    bool _731 = _727 || _729;
                    bool _733 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _735 = _731 || _733;
                    float _737 = 1.0 / _715;
                    float _739 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _741 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _739;
                    float _743 = _741 * _737;
                    bool _745 = !_711;
                    if (!_745)
                    {
                        float _747 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _749 = _349 + _747;
                        float _751 = _743 + (-1.0);
                        float _753 = _749 * _737;
                        float _755 = -_753;
                        float _757 = _755 + 1.0;
                        float _759 = _743 * _753;
                        float _761 = abs(_757);
                        float _763 = log2(_761);
                        float _765 = _763 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _767 = exp2(_765);
                        float _769 = fma(_751, _767, 1.0);
                        float _771 = 1.0 / _769;
                        float _773 = _759 * _771;
                        float _775 = fma(_715, _773, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _377 = _775;
                    }
                    float _777 = _377;
                    bool _779 = !_725;
                    if (!_779)
                    {
                        float _781 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _783 = _357 + _781;
                        float _785 = _743 + (-1.0);
                        float _787 = _783 * _737;
                        float _789 = -_787;
                        float _791 = _789 + 1.0;
                        float _793 = _743 * _787;
                        float _795 = abs(_791);
                        float _797 = log2(_795);
                        float _799 = _797 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _801 = exp2(_799);
                        float _803 = fma(_785, _801, 1.0);
                        float _805 = 1.0 / _803;
                        float _807 = _793 * _805;
                        float _809 = fma(_715, _807, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _379 = _809;
                    }
                    float _811 = _379;
                    bool _813 = !_735;
                    if (!_813)
                    {
                        float _815 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _817 = _365 + _815;
                        float _819 = _743 + (-1.0);
                        float _821 = _817 * _737;
                        float _823 = -_821;
                        float _825 = _823 + 1.0;
                        float _827 = _743 * _821;
                        float _829 = abs(_825);
                        float _831 = log2(_829);
                        float _833 = _831 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _835 = exp2(_833);
                        float _837 = fma(_819, _835, 1.0);
                        float _839 = 1.0 / _837;
                        float _841 = _827 * _839;
                        float _843 = fma(_715, _841, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _381 = _843;
                    }
                    float _845 = _381;
                    float _847 = precise::max(0.0, _845);
                    float _849 = precise::max(0.0, _777);
                    float _851 = precise::max(0.0, _811);
                    float _853 = precise::min(_847, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _855 = precise::min(_849, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _857 = precise::min(_851, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _513 = _855;
                    _515 = _857;
                    _523 = _853;
                    _525 = true;
                }
                else
                {
                    bool _859 = _537 != 2.0;
                    bool _861 = isnan(_537);
                    bool _863 = _859 || _861;
                    bool _865 = isnan(2.0);
                    bool _867 = _863 || _865;
                    if (!_867)
                    {
                        float _869 = _357 * 0.715200006961822509765625;
                        float _871 = fma(_349, 0.2125999927520751953125, _869);
                        float _873 = fma(_365, 0.072200000286102294921875, _871);
                        float _875 = spvFAdd(_873, 9.9999999747524270787835121154785e-07);
                        bool _877 = _873 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _879 = isnan(_873);
                        bool _881 = _877 || _879;
                        bool _883 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _885 = _881 || _883;
                        float _887 = 1.0 / _875;
                        bool _889 = !_885;
                        float _891 = _873;
                        if (!_889)
                        {
                            float _893 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _895 = _873 + _893;
                            float _897 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _899 = spvFAdd(_897, 1.00000095367431640625);
                            float _901 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _903 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _901;
                            float _905 = 1.0 / _899;
                            float _907 = _895 * _905;
                            float _909 = _903 * _905;
                            float _911 = -_907;
                            float _913 = _911 + 1.0;
                            float _915 = _909 + (-1.0);
                            float _917 = _909 * _907;
                            float _919 = abs(_913);
                            float _921 = log2(_919);
                            float _923 = _921 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _925 = exp2(_923);
                            float _927 = fma(_915, _925, 1.0);
                            float _929 = 1.0 / _927;
                            float _931 = _917 * _929;
                            float _933 = fma(_899, _931, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _891 = _933;
                        }
                        float _935 = _891;
                        float _937 = precise::max(0.0, _935);
                        float _939 = precise::min(_937, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _941 = _939 * _887;
                        float _943 = _349 * _941;
                        float _945 = _357 * _941;
                        float _947 = _365 * _941;
                        float _949 = precise::max(0.0, _943);
                        float _951 = precise::max(0.0, _945);
                        float _953 = precise::max(0.0, _947);
                        float _955 = precise::min(_949, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _957 = precise::min(_951, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _959 = precise::min(_953, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _513 = _955;
                        _515 = _957;
                        _523 = _959;
                        _525 = true;
                    }
                    else
                    {
                        bool _961 = _537 != 3.0;
                        bool _963 = isnan(_537);
                        bool _965 = _961 || _963;
                        bool _967 = isnan(3.0);
                        bool _969 = _965 || _967;
                        if (!_969)
                        {
                            float _971 = -_349;
                            float _973 = _971 + 1.0;
                            float _975 = -_357;
                            float _977 = _975 + 1.0;
                            float _979 = -_365;
                            float _981 = _979 + 1.0;
                            float _983 = abs(_973);
                            float _985 = log2(_983);
                            float _987 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _989 = abs(_977);
                            float _991 = log2(_989);
                            float _993 = abs(_981);
                            float _995 = log2(_993);
                            float _997 = _985 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _999 = _991 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1001 = exp2(_997);
                            float _1003 = _995 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1005 = exp2(_999);
                            float _1007 = exp2(_1003);
                            float _1009 = fma(_987, _1001, 1.0);
                            float _1011 = fma(_987, _1005, 1.0);
                            float _1013 = 1.0 / _1009;
                            float _1015 = fma(_987, _1007, 1.0);
                            float _1017 = 1.0 / _1011;
                            float _1019 = 1.0 / _1015;
                            float _1021 = _1013 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1023 = _1013 + _1017;
                            float _1025 = _1017 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1027 = _1019 + _1023;
                            float _1029 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1031 = precise::max(_1021, _1025);
                            float _1033 = _1027 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1035 = precise::max(_1029, _1031);
                            float _1037 = _1033 * 0.3333333432674407958984375;
                            float _1039 = -_1037;
                            float _1041 = _1035 + _1039;
                            float _1043 = fma(_1041, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1037);
                            float _1045 = -_1021;
                            float _1047 = _1045 + _1043;
                            float _1049 = -_1025;
                            float _1051 = _1049 + _1043;
                            float _1053 = -_1029;
                            float _1055 = _1053 + _1043;
                            float _1057 = fma(_1047, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1021);
                            float _1059 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1025);
                            float _1061 = fma(_1055, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1029);
                            float _1063 = _349 * _1057;
                            float _1065 = _357 * _1059;
                            float _1067 = _365 * _1061;
                            _513 = _1063;
                            _515 = _1065;
                            _523 = _1067;
                            _525 = true;
                        }
                        else
                        {
                            bool _1069 = _537 != 4.0;
                            bool _1071 = isnan(_537);
                            bool _1073 = _1069 || _1071;
                            bool _1075 = isnan(4.0);
                            bool _1077 = _1073 || _1075;
                            if (!_1077)
                            {
                                bool _1079 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1081 = isnan(0.0);
                                bool _1083 = _1079 || _1081;
                                bool _1085 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1087 = _1083 || _1085;
                                float _1109;
                                float _1111;
                                if (!_1087)
                                {
                                    float _1089 = -_349;
                                    float _1091 = _1089 + 1.0;
                                    float _1093 = abs(_1091);
                                    float _1095 = log2(_1093);
                                    float _1097 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1099 = _1095 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1101 = exp2(_1099);
                                    float _1103 = fma(_1097, _1101, 1.0);
                                    float _1105 = 1.0 / _1103;
                                    float _1107 = _1105 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1109 = _1095;
                                    _1111 = _1107;
                                    _1113 = true;
                                }
                                else
                                {
                                    float _1115 = spvFAdd(_349, 9.9999999747524270787835121154785e-07);
                                    bool _1117 = _349 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1119 = isnan(_349);
                                    bool _1121 = _1117 || _1119;
                                    bool _1123 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1125 = _1121 || _1123;
                                    float _1127 = 1.0 / _1115;
                                    if (!_1125)
                                    {
                                        _557 = _349;
                                    }
                                    float _1129 = _557;
                                    bool _1131 = !_1125;
                                    float _1133 = _1129;
                                    _1109 = _1127;
                                    if (!_1131)
                                    {
                                        float _1135 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1137 = _349 + _1135;
                                        float _1139 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1141 = spvFAdd(_1139, 1.00000095367431640625);
                                        float _1143 = 1.0 / _1141;
                                        float _1145 = _1137 * _1143;
                                        float _1147 = -_1145;
                                        float _1149 = _1147 + 1.0;
                                        float _1151 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1153 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1151;
                                        float _1155 = abs(_1149);
                                        float _1157 = log2(_1155);
                                        float _1159 = _1153 * _1143;
                                        float _1161 = _1159 + (-1.0);
                                        float _1163 = _1159 * _1145;
                                        float _1165 = _1157 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1167 = exp2(_1165);
                                        float _1169 = fma(_1161, _1167, 1.0);
                                        float _1171 = 1.0 / _1169;
                                        float _1173 = _1163 * _1171;
                                        float _1175 = fma(_1141, _1173, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1133 = _1175;
                                    }
                                    float _1177 = _1133;
                                    float _1179 = precise::max(0.0, _1177);
                                    float _1181 = precise::min(_1179, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1183 = _1181 * _1127;
                                    _1111 = _1183;
                                }
                                _1113 = false;
                                float _1185 = _1109;
                                float _1187 = _1111;
                                float _1189 = _1185;
                                float _1211;
                                float _1213;
                                if (!_1087)
                                {
                                    float _1191 = -_357;
                                    float _1193 = _1191 + 1.0;
                                    float _1195 = abs(_1193);
                                    float _1197 = log2(_1195);
                                    float _1199 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1201 = _1197 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1203 = exp2(_1201);
                                    float _1205 = fma(_1199, _1203, 1.0);
                                    float _1207 = 1.0 / _1205;
                                    float _1209 = _1207 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1211 = _1197;
                                    _1213 = _1209;
                                    _1215 = true;
                                }
                                else
                                {
                                    float _1217 = spvFAdd(_357, 9.9999999747524270787835121154785e-07);
                                    bool _1219 = _357 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1221 = isnan(_357);
                                    bool _1223 = _1219 || _1221;
                                    bool _1225 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1227 = _1223 || _1225;
                                    float _1229 = 1.0 / _1217;
                                    if (!_1227)
                                    {
                                        _1189 = _357;
                                    }
                                    float _1231 = _1189;
                                    bool _1233 = !_1227;
                                    float _1235 = _1231;
                                    _1211 = _1229;
                                    if (!_1233)
                                    {
                                        float _1237 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1239 = _357 + _1237;
                                        float _1241 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1243 = spvFAdd(_1241, 1.00000095367431640625);
                                        float _1245 = 1.0 / _1243;
                                        float _1247 = _1239 * _1245;
                                        float _1249 = -_1247;
                                        float _1251 = _1249 + 1.0;
                                        float _1253 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1255 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1253;
                                        float _1257 = abs(_1251);
                                        float _1259 = log2(_1257);
                                        float _1261 = _1255 * _1245;
                                        float _1263 = _1261 + (-1.0);
                                        float _1265 = _1261 * _1247;
                                        float _1267 = _1259 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1269 = exp2(_1267);
                                        float _1271 = fma(_1263, _1269, 1.0);
                                        float _1273 = 1.0 / _1271;
                                        float _1275 = _1265 * _1273;
                                        float _1277 = fma(_1243, _1275, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1235 = _1277;
                                    }
                                    float _1279 = _1235;
                                    float _1281 = precise::max(0.0, _1279);
                                    float _1283 = precise::min(_1281, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1285 = _1283 * _1229;
                                    _1213 = _1285;
                                }
                                _1215 = false;
                                float _1287 = _1211;
                                float _1289 = _1213;
                                float _1291 = _1287;
                                float _1313;
                                if (!_1087)
                                {
                                    float _1293 = -_365;
                                    float _1295 = _1293 + 1.0;
                                    float _1297 = abs(_1295);
                                    float _1299 = log2(_1297);
                                    float _1301 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1303 = _1299 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1305 = exp2(_1303);
                                    float _1307 = fma(_1301, _1305, 1.0);
                                    float _1309 = 1.0 / _1307;
                                    float _1311 = _1309 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1313 = _1311;
                                    _1315 = true;
                                }
                                else
                                {
                                    float _1317 = spvFAdd(_365, 9.9999999747524270787835121154785e-07);
                                    bool _1319 = _365 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1321 = isnan(_365);
                                    bool _1323 = _1319 || _1321;
                                    bool _1325 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1327 = _1323 || _1325;
                                    float _1329 = 1.0 / _1317;
                                    if (!_1327)
                                    {
                                        _1291 = _365;
                                    }
                                    float _1331 = _1291;
                                    bool _1333 = !_1327;
                                    float _1335 = _1331;
                                    if (!_1333)
                                    {
                                        float _1337 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1339 = _365 + _1337;
                                        float _1341 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1343 = spvFAdd(_1341, 1.00000095367431640625);
                                        float _1345 = 1.0 / _1343;
                                        float _1347 = _1339 * _1345;
                                        float _1349 = -_1347;
                                        float _1351 = _1349 + 1.0;
                                        float _1353 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1355 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1353;
                                        float _1357 = abs(_1351);
                                        float _1359 = log2(_1357);
                                        float _1361 = _1355 * _1345;
                                        float _1363 = _1361 + (-1.0);
                                        float _1365 = _1361 * _1347;
                                        float _1367 = _1359 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1369 = exp2(_1367);
                                        float _1371 = fma(_1363, _1369, 1.0);
                                        float _1373 = 1.0 / _1371;
                                        float _1375 = _1365 * _1373;
                                        float _1377 = fma(_1343, _1375, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1335 = _1377;
                                    }
                                    float _1379 = _1335;
                                    float _1381 = precise::max(0.0, _1379);
                                    float _1383 = precise::min(_1381, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1385 = _1383 * _1329;
                                    _1313 = _1385;
                                }
                                _1315 = false;
                                float _1387 = _1313;
                                float _1389 = precise::max(_1187, _1289);
                                float _1391 = precise::max(_1389, _1387);
                                float _1393 = -_1187;
                                float _1395 = _1391 + _1393;
                                float _1397 = -_1289;
                                float _1399 = _1391 + _1397;
                                float _1401 = -_1387;
                                float _1403 = _1391 + _1401;
                                float _1405 = fma(_1395, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1187);
                                float _1407 = fma(_1399, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1289);
                                float _1409 = fma(_1403, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1387);
                                float _1411 = _349 * _1405;
                                float _1413 = _357 * _1407;
                                float _1415 = _365 * _1409;
                                _513 = _1411;
                                _515 = _1413;
                                _523 = _1415;
                                _525 = true;
                            }
                            else
                            {
                                bool _1417 = _537 != 5.0;
                                bool _1419 = isnan(_537);
                                bool _1421 = _1417 || _1419;
                                bool _1423 = isnan(5.0);
                                bool _1425 = _1421 || _1423;
                                if (!_1425)
                                {
                                    _559 = _285;
                                }
                                float _1427 = _559;
                                float _1429 = _1427;
                                _513 = _1427;
                                if (!_1425)
                                {
                                    _561 = _287;
                                }
                                float _1431 = _561;
                                float _1433 = _1431;
                                _515 = _1431;
                                if (!_1425)
                                {
                                    _563 = _289;
                                }
                                float _1435 = _563;
                                bool _1437 = !_1425;
                                float _1439 = _1435;
                                _523 = _1435;
                                if (!_1437)
                                {
                                    bool _1441 = _537 != 6.0;
                                    bool _1443 = isnan(_537);
                                    bool _1445 = _1441 || _1443;
                                    bool _1447 = isnan(6.0);
                                    bool _1449 = _1445 || _1447;
                                    if (!_1449)
                                    {
                                        float _1451 = -_349;
                                        float _1453 = _1451 + 1.0;
                                        float _1455 = -_357;
                                        float _1457 = _1455 + 1.0;
                                        float _1459 = -_365;
                                        float _1461 = _1459 + 1.0;
                                        float _1463 = abs(_1453);
                                        float _1465 = log2(_1463);
                                        float _1467 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1469 = abs(_1457);
                                        float _1471 = log2(_1469);
                                        float _1473 = abs(_1461);
                                        float _1475 = log2(_1473);
                                        float _1477 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1479 = _1471 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1481 = exp2(_1477);
                                        float _1483 = _1475 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1485 = exp2(_1479);
                                        float _1487 = exp2(_1483);
                                        float _1489 = fma(_1467, _1481, 1.0);
                                        float _1491 = fma(_1467, _1485, 1.0);
                                        float _1493 = 1.0 / _1489;
                                        float _1495 = fma(_1467, _1487, 1.0);
                                        float _1497 = 1.0 / _1491;
                                        float _1499 = 1.0 / _1495;
                                        float _1501 = _1493 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1503 = _1497 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1505 = precise::max(_1501, _1503);
                                        float _1507 = _1499 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1509 = precise::max(_1507, _1505);
                                        float _1511 = -_1501;
                                        float _1513 = _1511 + _1509;
                                        float _1515 = -_1503;
                                        float _1517 = _1515 + _1509;
                                        float _1519 = -_1507;
                                        float _1521 = _1519 + _1509;
                                        float _1523 = fma(_1513, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1501);
                                        float _1525 = fma(_1517, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1503);
                                        float _1527 = fma(_1521, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1507);
                                        float _1529 = _349 * _1523;
                                        float _1531 = _357 * _1525;
                                        float _1533 = _365 * _1527;
                                        _513 = _1529;
                                        _515 = _1531;
                                        _523 = _1533;
                                        _525 = true;
                                    }
                                    else
                                    {
                                        bool _1535 = _537 != 7.0;
                                        bool _1537 = isnan(_537);
                                        bool _1539 = _1535 || _1537;
                                        bool _1541 = isnan(7.0);
                                        bool _1543 = _1539 || _1541;
                                        if (_1543)
                                        {
                                            _1429 = 0.0;
                                            _1433 = 0.0;
                                        }
                                        float _1545 = _1429;
                                        float _1547 = _1433;
                                        _513 = _1545;
                                        _515 = _1547;
                                        if (_1543)
                                        {
                                            _1439 = 0.0;
                                        }
                                        float _1549 = _1439;
                                        _523 = _1549;
                                        if (!_1543)
                                        {
                                            float _1551 = -_349;
                                            float _1553 = _1551 + 1.0;
                                            float _1555 = -_357;
                                            float _1557 = _1555 + 1.0;
                                            float _1559 = -_365;
                                            float _1561 = _1559 + 1.0;
                                            float _1563 = abs(_1553);
                                            float _1565 = log2(_1563);
                                            float _1567 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1569 = abs(_1557);
                                            float _1571 = log2(_1569);
                                            float _1573 = abs(_1561);
                                            float _1575 = log2(_1573);
                                            float _1577 = _1565 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1579 = _1571 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1581 = exp2(_1577);
                                            float _1583 = _1575 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1585 = exp2(_1579);
                                            float _1587 = exp2(_1583);
                                            float _1589 = fma(_1567, _1581, 1.0);
                                            float _1591 = fma(_1567, _1585, 1.0);
                                            float _1593 = 1.0 / _1589;
                                            float _1595 = fma(_1567, _1587, 1.0);
                                            float _1597 = 1.0 / _1591;
                                            float _1599 = 1.0 / _1595;
                                            float _1601 = _1593 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1603 = -_349;
                                            float _1605 = fma(_349, _1601, _1603);
                                            float _1607 = _1597 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1609 = -_357;
                                            float _1611 = fma(_357, _1607, _1609);
                                            float _1613 = _1599 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1615 = _1605 + _1611;
                                            float _1617 = -_365;
                                            float _1619 = fma(_365, _1613, _1617);
                                            float _1621 = _1619 + _1615;
                                            float _1623 = -_1605;
                                            float _1625 = fma(_1621, 0.3333333432674407958984375, _1623);
                                            float _1627 = -_1611;
                                            float _1629 = fma(_1621, 0.3333333432674407958984375, _1627);
                                            float _1631 = -_1619;
                                            float _1633 = fma(_1621, 0.3333333432674407958984375, _1631);
                                            float _1635 = fma(_1625, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1605);
                                            float _1637 = fma(_1629, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1611);
                                            float _1639 = fma(_1633, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1619);
                                            float _1641 = _349 + _1635;
                                            float _1643 = _357 + _1637;
                                            float _1645 = _365 + _1639;
                                            _513 = _1641;
                                            _515 = _1643;
                                            _523 = _1645;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _525 = false;
        float _1647 = _513;
        float _1649 = _515;
        float _1651 = _523;
        _467 = _1647;
        _469 = _1649;
        _471 = _1651;
    }
    _473 = false;
    float _1653 = _467;
    float _1655 = _469;
    float _1657 = _471;
    float _1659 = _1653 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1661 = _1655 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1663 = _1657 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_43.x = _1659;
    out.m_43.y = _1661;
    out.m_43.z = _1663;
    out.m_43.w = _79;
    return out;
}

