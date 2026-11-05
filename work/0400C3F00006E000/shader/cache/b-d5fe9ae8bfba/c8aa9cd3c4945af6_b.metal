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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _67 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _69 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _67;
    float _71 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _65);
    float _73 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _75 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _73;
    float _77 = _69 * _69;
    float _79 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _71);
    float _81 = in.m_37.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _89 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _87;
    float _91 = fma(_75, _75, _77);
    float _93 = in.m_37.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = rsqrt(_79);
    float _101 = fma(_89, _89, _91);
    float _103 = rsqrt(_101);
    float _105 = 1.0 / _57;
    float _107 = _99 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _109 = _75 * _103;
    float _111 = _69 * _103;
    float _113 = _89 * _103;
    float _115 = _99 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _117 = _99 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _119 = _107 * _109;
    float _121 = _115 * _113;
    float _123 = _117 * _111;
    float _125 = -_119;
    float _127 = fma(_115, _111, _125);
    float _129 = _105 * _63;
    float _131 = -_121;
    float _133 = fma(_117, _109, _131);
    float _135 = -_123;
    float _137 = fma(_107, _113, _135);
    float _139 = _109 * _127;
    float _141 = _105 * _85;
    float _143 = _113 * _133;
    float _145 = _111 * _137;
    float _147 = -_139;
    float _149 = fma(_113, _137, _147);
    float _151 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _153 = _129 + _151;
    float _155 = -_143;
    float _157 = fma(_111, _127, _155);
    float _159 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _161 = _141 + _159;
    float _163 = _105 * _97;
    float _165 = _133 * _153;
    float _167 = _153 * _149;
    float _169 = -_145;
    float _171 = fma(_109, _133, _169);
    float _173 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _175 = _163 + _173;
    float _177 = fma(_137, _161, _165);
    float _179 = fma(_161, _157, _167);
    float _181 = in.m_39.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_39.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = fma(_127, _175, _177);
    float _195 = fma(_175, _171, _179);
    float _197 = _195 * (-0.0625);
    float _199 = abs(_193);
    float _201 = abs(_195);
    float _203 = precise::max(_199, _201);
    bool _207 = _203 >= 16.0;
    float _209 = _193 * 0.0625;
    float _211 = -_195;
    float _213 = _207 ? _197 : _211;
    float _215 = _195 * _195;
    float _217 = _207 ? _209 : _193;
    float _219 = abs(_213);
    bool _221 = _219 != 0.0;
    bool _223 = isnan(_219);
    bool _225 = _221 || _223;
    bool _227 = isnan(0.0);
    bool _229 = _225 || _227;
    float _231 = fma(_193, _193, _215);
    float _233 = abs(_217);
    bool _235 = _233 == 0.0;
    float _237 = abs(_217);
    bool _239 = _237 == 0.0;
    bool _241 = !_229;
    bool _243 = _239 && _241;
    float _245 = sqrt(_231);
    bool _247 = false;
    int _250 = as_type<int>(_215);
    if (_243)
    {
        bool _252 = as_type<int>(_217) >= 0;
        _247 = _252;
    }
    bool _254 = _247;
    int _256 = _254 ? (-1) : 0;
    if (_243)
    {
        int _258 = _254 ? 0 : 1078530011;
        _250 = _258;
    }
    int _260 = _250;
    float _262 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.0166666693985462188720703125, _245);
    int _264 = _260;
    if (_243)
    {
        int _266 = int(0x80000000) & as_type<int>(_213);
        int _268 = _260 | _266;
        _264 = _268;
    }
    int _270 = _264;
    bool _272 = !_229;
    bool _274 = _272 && _235;
    int _276 = _270;
    float _278 = as_type<float>(_270);
    if (!_274)
    {
        float _280 = abs(_213);
        bool _282 = _280 != as_type<float>(0x7f800000u /* inf */);
        bool _284 = isnan(_280);
        bool _286 = _282 || _284;
        bool _288 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _290 = _286 || _288;
        float _292 = abs(_217);
        bool _294 = _292 == as_type<float>(0x7f800000u /* inf */);
        float _296 = abs(_217);
        bool _298 = _296 == as_type<float>(0x7f800000u /* inf */);
        bool _300 = !_290;
        bool _302 = _298 && _300;
        if (_302)
        {
            bool _304 = as_type<int>(_217) >= 0;
            _256 = _304 ? (-1) : 0;
        }
        int _306 = _256;
        if (_302)
        {
            _276 = 1075235812;
        }
        int _308 = _276;
        int _310 = _308;
        if (_302)
        {
            int _312 = ~_306;
            int _314 = (_312 != 0) ? _308 : 1061752795;
            _310 = _314;
        }
        int _316 = _310;
        float _318 = as_type<float>(_316);
        if (_302)
        {
            int _320 = int(0x80000000) & as_type<int>(_213);
            int _322 = _316 | _320;
            _318 = as_type<float>(_322);
        }
        float _324 = _318;
        bool _326 = !_290;
        bool _328 = _326 && _294;
        _278 = _324;
        if (!_328)
        {
            float _330 = abs(_213);
            float _332 = abs(_217);
            float _334 = precise::max(_330, _332);
            float _336 = abs(_213);
            float _338 = abs(_217);
            float _340 = precise::min(_336, _338);
            float _342 = 1.0 / _334;
            float _344 = abs(_213);
            float _346 = abs(_217);
            bool _348 = _344 > _346;
            bool _350 = as_type<int>(_217) >= 0;
            float _352 = _340 * _342;
            float _354 = abs(_213);
            float _356 = abs(_217);
            float _358 = _354 + _356;
            int _360 = as_type<int>(_213) & int(0x80000000);
            float _362 = _352 * _352;
            bool _364 = _358 > as_type<float>(0x7f800000u /* inf */);
            bool _366 = isnan(_358);
            bool _368 = _364 || _366;
            bool _370 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _372 = _368 || _370;
            float _374 = _362 + 11.33538818359375;
            float _376 = fma(_362, _374, 28.84246826171875);
            float _378 = fma(_362, _376, 19.6966705322265625);
            float _380 = fma(_362, -0.82336294651031494140625, -5.674867153167724609375);
            float _382 = fma(_362, _380, -6.565555095672607421875);
            float _384 = 1.0 / _378;
            float _386 = _362 * _382;
            float _388 = _352 * _386;
            float _390 = fma(_388, _384, _352);
            float _392 = _390;
            _278 = _358;
            if (_348)
            {
                float _394 = -_390;
                float _396 = _394 + 1.57079637050628662109375;
                _392 = _396;
            }
            float _398 = _392;
            int _400 = as_type<int>(_398);
            if (!_350)
            {
                float _402 = -_398;
                float _404 = _402 + 3.1415927410125732421875;
                _400 = as_type<int>(_404);
            }
            int _406 = _400;
            if (!_372)
            {
                int _408 = _360 | _406;
                _278 = as_type<float>(_408);
            }
        }
    }
    float _410 = _278;
    float _412 = _105 * _185;
    float _414 = _105 * _191;
    float _416 = _410 * 0.31830990314483642578125;
    float _418 = _262 * 0.0625;
    float2 _1183 = float2(_412, _414);
    float4 _421 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1183, float2(0.0), isnan(_1183))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1183, float2(0.0), isnan(_1183))).xyzw;
    float _423 = _421.x;
    float _425 = _421.y;
    float _427 = _421.z;
    float _429 = _421.w;
    float2 _1201 = float2(_416, _418);
    float _431 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1201, float2(0.0), isnan(_1201))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1201, float2(0.0), isnan(_1201))).w;
    float _433 = in.m_41.w;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_43.w;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_45.x;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = _105 * _437;
    float _453 = _105 * _443;
    float _455 = in.m_43.x;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_43.z;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_41.y;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_41.x;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_41.z;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = _429 * _431;
    float _487 = _451 * _485;
    float _489 = _105 * _449;
    float _491 = _453 * _487;
    float _493 = 0.0 + _491;
    float _495 = precise::clamp(_493, 0.0, 1.0);
    float _497 = _495 * _489;
    bool _499 = _497 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _501 = isnan(_497);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _507 = _503 || _505;
    float _509 = in.m_43.y;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    if (!_507)
    {
        discard_fragment();
    }
    float _515 = _105 * _459;
    float _517 = _105 * _465;
    float _519 = -_425;
    float _521 = _519 + 1.0;
    float _523 = -_427;
    float _525 = _523 + 1.0;
    float _527 = _105 * _513;
    float _529 = -_423;
    float _531 = _529 + 1.0;
    float _533 = _527 * _521;
    float _535 = _515 * _531;
    float _537 = _517 * _525;
    float _539 = _105 * _471;
    float _541 = _105 * _477;
    float _543 = _105 * _483;
    float _545 = fma(_425, _539, _533);
    float _547 = fma(_423, _541, _535);
    float _549 = fma(_427, _543, _537);
    if (!_507)
    {
        out.m_48.x = _547;
        out.m_48.y = _545;
        out.m_48.z = _549;
        out.m_48.w = _491;
        return out;
    }
    float _551 = _545 * 0.715200006961822509765625;
    float _553 = 0.0 + _497;
    float _555 = precise::clamp(_553, 0.0, 1.0);
    float _557 = fma(_547, 0.2125999927520751953125, _551);
    bool _559 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _561 = fma(_549, 0.072200000286102294921875, _557);
    float _563 = 1.0 / _561;
    float _565 = _563 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _567 = precise::clamp(_565, 0.0, 1.0);
    float _569 = fma(_567, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _571 = _547 * _569;
    float _573 = _545 * _569;
    float _575 = _549 * _569;
    float _577 = _569;
    if (!_559)
    {
        _577 = _555;
    }
    float _579 = _577;
    bool _581 = !_559;
    float _583 = _579;
    if (!_581)
    {
        float _585 = in.m_50.w;
        float _587 = gl_FragCoord.w;
        float _589 = _585 * _587;
        float _591 = in.m_50.z;
        float _593 = gl_FragCoord.w;
        float _595 = _591 * _593;
        float _597 = _105 * _589;
        float _599 = _105 * _595;
        float _601 = 1.0 / _597;
        float _603 = _599 * _601;
        float _605 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _607 = fma(_603, (*spvDescriptorSet0.fp_c8)._m0[30].w, _605);
        float _609 = 1.0 / _607;
        float _611 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _613 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _615 = fma(_609, _611, _613);
        float _617 = _615 * 8.0;
        float _619 = precise::clamp(_617, 0.0, 1.0);
        float _621 = _555 * _619;
        _583 = _621;
    }
    float _623 = _583;
    float _625 = 0.0 + _623;
    float _627 = precise::clamp(_625, 0.0, 1.0);
    out.m_48.x = _571;
    out.m_48.y = _573;
    out.m_48.z = _575;
    out.m_48.w = _627;
    return out;
}

