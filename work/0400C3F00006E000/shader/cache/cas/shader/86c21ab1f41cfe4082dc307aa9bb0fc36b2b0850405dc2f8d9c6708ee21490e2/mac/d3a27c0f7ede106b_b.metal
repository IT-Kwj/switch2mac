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

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_39.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_39.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_41.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _93 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _91);
    float _95 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _93);
    float _97 = _95 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _99 = 1.0 / _59;
    float _101 = _99 * _65;
    float _103 = _99 * _71;
    float _105 = _99 * _77;
    float _107 = _99 * _89;
    float _109 = _101 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _111 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[2].x, _109);
    float _113 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[2].z, _111);
    float _115 = _113 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _117 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _119 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _121 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _117);
    float _123 = 1.0 / _115;
    float _125 = _101 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _127 = _101 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _129 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _119);
    float _131 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _121);
    float _133 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[0].x, _125);
    float _135 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[1].x, _127);
    float _137 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _129);
    float _139 = _131 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _141 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[0].z, _133);
    float _143 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[1].z, _135);
    float _145 = _137 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _147 = in.m_41.y;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = _141 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _155 = _143 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _157 = _97 * _123;
    float _159 = -_139;
    float _161 = fma(_153, _157, _159);
    float _163 = -_145;
    float _165 = fma(_155, _157, _163);
    float _167 = in.m_43.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _161 * 0.0625;
    float _175 = _165 * 0.0625;
    float _177 = abs(_161);
    float _179 = abs(_165);
    float _181 = precise::max(_177, _179);
    bool _185 = _181 >= 16.0;
    float _187 = in.m_43.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = _185 ? _175 : _165;
    float _195 = _165 * _165;
    float _197 = _185 ? _173 : _161;
    float _199 = abs(_193);
    bool _201 = _199 != 0.0;
    bool _203 = isnan(_199);
    bool _205 = _201 || _203;
    bool _207 = isnan(0.0);
    bool _209 = _205 || _207;
    float _211 = fma(_161, _161, _195);
    float _213 = _99 * _83;
    float _215 = abs(_197);
    bool _217 = _215 == 0.0;
    float _219 = abs(_197);
    bool _221 = _219 == 0.0;
    bool _223 = !_209;
    bool _225 = _221 && _223;
    float _227 = sqrt(_211);
    float _229 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _231 = 1.0 / _213;
    bool _233 = false;
    int _236 = as_type<int>(_195);
    float _238 = _123;
    if (_225)
    {
        bool _240 = as_type<int>(_197) >= 0;
        _233 = _240;
    }
    bool _242 = _233;
    int _244 = _242 ? (-1) : 0;
    if (_225)
    {
        int _246 = _242 ? 0 : 1078530011;
        _236 = _246;
    }
    int _248 = _236;
    float _250 = -_229;
    float _252 = fma(_250, (*spvDescriptorSet0.fp_c9)._m0[194].y, _227);
    int _254 = _248;
    if (_225)
    {
        int _256 = int(0x80000000) & as_type<int>(_193);
        int _258 = _248 | _256;
        _238 = as_type<float>(_258);
    }
    float _260 = _238;
    bool _262 = !_209;
    bool _264 = _262 && _217;
    float _266 = _260;
    float _268 = _260;
    if (!_264)
    {
        float _270 = abs(_193);
        bool _272 = _270 != as_type<float>(0x7f800000u /* inf */);
        bool _274 = isnan(_270);
        bool _276 = _272 || _274;
        bool _278 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _280 = _276 || _278;
        float _282 = abs(_197);
        bool _284 = _282 == as_type<float>(0x7f800000u /* inf */);
        float _286 = abs(_197);
        bool _288 = _286 == as_type<float>(0x7f800000u /* inf */);
        bool _290 = !_280;
        bool _292 = _288 && _290;
        if (_292)
        {
            bool _294 = as_type<int>(_197) >= 0;
            _244 = _294 ? (-1) : 0;
        }
        int _296 = _244;
        if (_292)
        {
            _254 = 1075235812;
        }
        int _298 = _254;
        int _300 = _298;
        if (_292)
        {
            int _302 = ~_296;
            int _304 = (_302 != 0) ? _298 : 1061752795;
            _300 = _304;
        }
        int _306 = _300;
        if (_292)
        {
            int _308 = int(0x80000000) & as_type<int>(_193);
            int _310 = _306 | _308;
            _266 = as_type<float>(_310);
        }
        float _312 = _266;
        bool _314 = !_280;
        bool _316 = _314 && _284;
        _268 = _312;
        if (!_316)
        {
            float _318 = abs(_193);
            float _320 = abs(_197);
            float _322 = precise::max(_318, _320);
            float _324 = abs(_193);
            float _326 = abs(_197);
            float _328 = precise::min(_324, _326);
            float _330 = 1.0 / _322;
            float _332 = abs(_193);
            float _334 = abs(_197);
            bool _336 = _332 > _334;
            bool _338 = as_type<int>(_197) >= 0;
            float _340 = abs(_193);
            float _342 = abs(_197);
            float _344 = _340 + _342;
            bool _346 = _344 > as_type<float>(0x7f800000u /* inf */);
            bool _348 = isnan(_344);
            bool _350 = _346 || _348;
            bool _352 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _354 = _350 || _352;
            float _356 = _328 * _330;
            float _358 = _356 * _356;
            float _360 = _358 + 11.33538818359375;
            float _362 = fma(_358, _360, 28.84246826171875);
            float _364 = fma(_358, _362, 19.6966705322265625);
            float _366 = fma(_358, -0.82336294651031494140625, -5.674867153167724609375);
            float _368 = fma(_358, _366, -6.565555095672607421875);
            float _370 = 1.0 / _364;
            float _372 = _358 * _368;
            float _374 = _356 * _372;
            float _376 = fma(_374, _370, _356);
            int _378 = as_type<int>(_193) & int(0x80000000);
            float _380 = _376;
            _268 = _344;
            if (_336)
            {
                float _382 = -_376;
                float _384 = _382 + 1.57079637050628662109375;
                _380 = _384;
            }
            float _386 = _380;
            int _388 = as_type<int>(_386);
            if (!_338)
            {
                float _390 = -_386;
                float _392 = _390 + 3.1415927410125732421875;
                _388 = as_type<int>(_392);
            }
            int _394 = _388;
            if (!_354)
            {
                int _396 = _378 | _394;
                _268 = as_type<float>(_396);
            }
        }
    }
    float _398 = _268;
    float _400 = _99 * _151;
    float _402 = _107 * _231;
    float _404 = _398 * 0.31830990314483642578125;
    float _406 = _99 * _191;
    float _408 = _400 * _231;
    float _410 = _99 * _171;
    float _412 = _404 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _414 = _252 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float2 _1205 = float2(_402, _408);
    float _416 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1205, float2(0.0), isnan(_1205))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1205, float2(0.0), isnan(_1205))).x;
    float2 _1215 = float2(_410, _406);
    float4 _419 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1215, float2(0.0), isnan(_1215))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1215, float2(0.0), isnan(_1215))).xyzw;
    float _421 = _419.x;
    float _423 = _419.y;
    float _425 = _419.z;
    float _427 = _419.w;
    float2 _1231 = float2(_412, _414);
    float _429 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1231, float2(0.0), isnan(_1231))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1231, float2(0.0), isnan(_1231))).w;
    float _431 = in.m_41.z;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_45.w;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_47.w;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_49.x;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _457 = _99 * _435;
    float _459 = _457 * _231;
    float _461 = _99 * _441;
    float _463 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _465 = fma(_459, (*spvDescriptorSet0.fp_c8)._m0[30].w, _463);
    float _467 = 1.0 / _465;
    float _469 = in.m_47.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_45.z;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _483 = fma(_416, (*spvDescriptorSet0.fp_c8)._m0[30].w, _481);
    float _485 = 1.0 / _483;
    float _487 = _427 * _429;
    float _489 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _491 = _467 * _489;
    float _493 = _461 * _487;
    float _495 = _99 * _447;
    float _497 = _495 * _493;
    float _499 = precise::clamp(_497, 0.0, 1.0);
    float _501 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _503 = -_491;
    float _505 = fma(_485, _501, _503);
    float _507 = _505 * _455;
    float _509 = precise::clamp(_507, 0.0, 1.0);
    float _511 = _99 * _453;
    float _513 = _499 * _509;
    float _515 = _513 * _511;
    bool _517 = _515 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _519 = isnan(_515);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _525 = _521 || _523;
    float _527 = in.m_47.y;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = in.m_47.z;
    float _535 = gl_FragCoord.w;
    float _537 = _533 * _535;
    float _539 = in.m_45.x;
    float _541 = gl_FragCoord.w;
    float _543 = _539 * _541;
    float _545 = in.m_45.y;
    float _547 = gl_FragCoord.w;
    float _549 = _545 * _547;
    float _551 = _491;
    float _553 = _425;
    if (!_525)
    {
        discard_fragment();
    }
    float _555 = _99 * _473;
    float _557 = -_421;
    float _559 = _557 + 1.0;
    float _561 = _555 * _559;
    float _563 = _99 * _531;
    float _565 = _99 * _537;
    float _567 = -_423;
    float _569 = _567 + 1.0;
    float _571 = -_425;
    float _573 = _571 + 1.0;
    float _575 = _99 * _543;
    float _577 = _99 * _549;
    float _579 = _563 * _569;
    float _581 = _99 * _479;
    float _583 = _565 * _573;
    float _585 = fma(_421, _575, _561);
    float _587 = fma(_423, _577, _579);
    float _589 = fma(_425, _581, _583);
    if (!_525)
    {
        out.m_52.x = _585;
        out.m_52.y = _587;
        out.m_52.z = _589;
        out.m_52.w = _499;
        return out;
    }
    float _591 = _587 * 0.715200006961822509765625;
    float _593 = fma(_585, 0.2125999927520751953125, _591);
    float _595 = fma(_589, 0.072200000286102294921875, _593);
    bool _597 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _599 = 1.0 / _595;
    float _601 = 0.0 + _515;
    float _603 = precise::clamp(_601, 0.0, 1.0);
    float _605 = _603;
    if (_597)
    {
        float _607 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _609 = _491 + _607;
        _551 = _609;
    }
    float _611 = _551;
    float _613 = _599 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _615 = precise::clamp(_613, 0.0, 1.0);
    if (_597)
    {
        float _617 = _611 * 8.0;
        float _619 = precise::clamp(_617, 0.0, 1.0);
        _553 = _619;
    }
    float _621 = _553;
    float _623 = fma(_615, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_597)
    {
        float _625 = _603 * _621;
        _605 = _625;
    }
    float _627 = _605;
    float _629 = _585 * _623;
    float _631 = _587 * _623;
    float _633 = _589 * _623;
    float _635 = 0.0 + _627;
    float _637 = precise::clamp(_635, 0.0, 1.0);
    out.m_52.x = _629;
    out.m_52.y = _631;
    out.m_52.z = _633;
    out.m_52.w = _637;
    return out;
}

