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
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_58 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_37 [[user(locn8)]];
    float4 m_56 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _99 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _97);
    float _101 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _99);
    float _103 = _101 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _105 = 1.0 / _65;
    float _107 = _105 * _71;
    float _109 = _105 * _77;
    float _111 = _105 * _83;
    float _113 = _107 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _115 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[2].x, _113);
    float _117 = fma(_111, (*spvDescriptorSet0.fp_c8)._m0[2].z, _115);
    float _119 = _117 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _121 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _123 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _125 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _121);
    float _127 = 1.0 / _119;
    float _129 = _107 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _131 = _107 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _133 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _123);
    float _135 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _125);
    float _137 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[0].x, _129);
    float _139 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[1].x, _131);
    float _141 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _133);
    float _143 = _135 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _145 = fma(_111, (*spvDescriptorSet0.fp_c8)._m0[0].z, _137);
    float _147 = fma(_111, (*spvDescriptorSet0.fp_c8)._m0[1].z, _139);
    float _149 = _141 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _151 = _145 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _153 = _147 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _155 = _103 * _127;
    float _157 = _105 * _89;
    float _159 = -_149;
    float _161 = fma(_153, _155, _159);
    float _163 = -_143;
    float _165 = fma(_151, _155, _163);
    float _167 = _105 * _95;
    float _169 = _161 * 0.53033006191253662109375;
    float _171 = -_169;
    float _173 = fma(_165, 0.53033006191253662109375, _171);
    float _175 = fma(_165, 0.53033006191253662109375, _169);
    float2 _763 = float2(_173, _175);
    float4 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_763, float2(0.0), isnan(_763))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_763, float2(0.0), isnan(_763))).xyzw;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float _186 = _178.w;
    float2 _782 = float2(_157, _167);
    float _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_782, float2(0.0), isnan(_782))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_782, float2(0.0), isnan(_782))).w;
    float _190 = in.m_41.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_41.x;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_41.z;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_43.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_43.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_43.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = _105 * _194;
    float _228 = _105 * _200;
    float _230 = _105 * _206;
    float _232 = _226 * _226;
    float _234 = in.m_45.w;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = fma(_228, _228, _232);
    float _242 = fma(_230, _230, _240);
    float _244 = _105 * _212;
    float _246 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _248 = _246 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _250 = rsqrt(_242);
    float _252 = 1.0 / _248;
    float _254 = _226 * _250;
    float _256 = _228 * _250;
    float _258 = in.m_47.w;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = _244 * _254;
    float _266 = _105 * _218;
    float _268 = _230 * _250;
    float _270 = fma(_266, _256, _264);
    float _272 = _105 * _224;
    float _274 = _105 * _238;
    float _276 = in.m_49.w;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = fma(_272, _268, _270);
    float _284 = -_274;
    float _286 = _284 + 1.0;
    float _288 = abs(_282);
    float _290 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _292 = _288 + _290;
    float _294 = -_286;
    float _296 = fma(_294, _286, 1.0);
    float _298 = _292 * _252;
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = fma(_300, -2.0, 3.0);
    float _304 = _300 * _300;
    float _306 = _302 * _304;
    float _308 = in.m_51.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = _105 * _262;
    float _316 = in.m_47.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_49.y;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_47.y;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_47.z;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = _105 * _326;
    float _342 = _186 * _296;
    float _344 = fma(_188, -0.5, 1.0);
    float _346 = _342 * _344;
    float _348 = _314 + 0.0500000007450580596923828125;
    float _350 = precise::max(_314, _346);
    float _352 = precise::min(_348, _350);
    float _354 = _105 * _280;
    float _356 = -_314;
    float _358 = _356 + _352;
    float _360 = _358 * 20.0;
    float _362 = _354 * _360;
    float _364 = _105 * _312;
    float _366 = fma(_354, _274, _362);
    float _368 = 0.0 + _366;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = _370 * _306;
    float _374 = _372 * _364;
    bool _378 = _374 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _380 = isnan(_374);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _386 = _382 || _384;
    float _388 = in.m_49.x;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_49.z;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    if (!_386)
    {
        discard_fragment();
    }
    float _400 = _105 * _320;
    float _402 = _105 * _332;
    float _404 = _105 * _338;
    float _406 = _362 * _362;
    float _408 = _182 * _182;
    float _410 = -_340;
    float _412 = _410 + _402;
    float _414 = fma(_274, _412, _340);
    float _416 = _184 * _184;
    float _418 = fma(_408, _406, _414);
    float _420 = _105 * _392;
    float _422 = _105 * _398;
    float _424 = -_420;
    float _426 = _424 + _400;
    float _428 = -_422;
    float _430 = _428 + _404;
    float _432 = fma(_274, _426, _420);
    float _434 = fma(_274, _430, _422);
    float _436 = _180 * _180;
    float _438 = fma(_416, _406, _434);
    float _440 = fma(_436, _406, _432);
    if (!_386)
    {
        out.m_54.x = _440;
        out.m_54.y = _418;
        out.m_54.z = _438;
        out.m_54.w = _366;
        return out;
    }
    float _442 = _418 * 0.715200006961822509765625;
    float _444 = in.m_56.w;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = in.m_56.x;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = in.m_56.y;
    float _458 = gl_FragCoord.w;
    float _460 = _456 * _458;
    float _462 = fma(_440, 0.2125999927520751953125, _442);
    float _464 = in.m_56.z;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    bool _470 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _472 = fma(_438, 0.072200000286102294921875, _462);
    float _474 = 1.0 / _472;
    float _476 = _474 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _478 = precise::clamp(_476, 0.0, 1.0);
    float _480 = 0.0 + _374;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _105 * _448;
    float _486 = fma(_478, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _488 = _105 * _468;
    float _490 = _486 * _484;
    float _492 = _105 * _454;
    float _494 = _105 * _460;
    float _496 = fma(_438, _490, _488);
    float _498 = fma(_440, _490, _492);
    float _500 = fma(_418, _490, _494);
    bool _502 = !_470;
    float _504 = _482;
    if (!_502)
    {
        float _506 = in.m_58.w;
        float _508 = gl_FragCoord.w;
        float _510 = _506 * _508;
        float _512 = in.m_58.z;
        float _514 = gl_FragCoord.w;
        float _516 = _512 * _514;
        float _518 = _105 * _510;
        float _520 = _105 * _516;
        float _522 = 1.0 / _518;
        float _524 = _520 * _522;
        float _526 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _528 = fma(_524, (*spvDescriptorSet0.fp_c8)._m0[30].w, _526);
        float _530 = 1.0 / _528;
        float _532 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _534 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _536 = fma(_530, _532, _534);
        float _538 = _536 * 8.0;
        float _540 = precise::clamp(_538, 0.0, 1.0);
        float _542 = _482 * _540;
        _504 = _542;
    }
    float _544 = _504;
    float _546 = 0.0 + _544;
    float _548 = precise::clamp(_546, 0.0, 1.0);
    out.m_54.x = _498;
    out.m_54.y = _500;
    out.m_54.z = _496;
    out.m_54.w = _548;
    return out;
}

