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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _61;
    float _95 = _93 * _67;
    float _97 = _93 * _73;
    float _99 = _93 * _79;
    float _101 = _93 * _85;
    float _103 = 1.0 / _95;
    float _105 = _97 * _103;
    float _107 = _99 * _103;
    float _109 = _93 * _91;
    float2 _618 = float2(_105, _107);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_618, float2(0.0), isnan(_618))).x;
    float2 _629 = float2(_101, _109);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_629, float2(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_629, float2(0.0), isnan(_629))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float _124 = in.m_39.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_41.y;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_39.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_41.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_41.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_39.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _93 * _128;
    float _162 = _93 * _134;
    float _164 = _93 * _140;
    float _166 = _93 * _146;
    float _168 = _160 * _160;
    float _170 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _172 = _162 + _170;
    float _174 = _93 * _152;
    float _176 = _93 * _158;
    float _178 = fma(_164, _164, _168);
    float _180 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _182 = _166 + _180;
    float _184 = _172 * _172;
    float _186 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _188 = _174 + _186;
    float _190 = fma(_176, _176, _178);
    float _192 = fma(_182, _182, _184);
    float _194 = fma(_188, _188, _192);
    float _196 = rsqrt(_190);
    float _198 = rsqrt(_194);
    float _200 = _160 * _196;
    float _202 = _164 * _196;
    float _204 = _176 * _196;
    float _206 = _200 * _200;
    float _208 = _172 * _198;
    float _210 = _182 * _198;
    float _212 = _188 * _198;
    float _214 = fma(_202, _202, _206);
    float _216 = _208 * _208;
    float _218 = in.m_35.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = fma(_204, _204, _214);
    float _226 = fma(_210, _210, _216);
    float _228 = fma(_212, _212, _226);
    float _230 = rsqrt(_224);
    float _232 = in.m_43.w;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = rsqrt(_228);
    float _240 = _200 * _230;
    float _242 = in.m_45.w;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = _202 * _230;
    float _250 = _204 * _230;
    float _252 = _208 * _238;
    float _254 = _210 * _238;
    float _256 = in.m_47.w;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = _212 * _238;
    float _264 = _240 * _252;
    float _266 = _93 * _222;
    float _268 = fma(_248, _254, _264);
    float _270 = _266 * _103;
    float _272 = fma(_250, _262, _268);
    float _274 = _93 * _236;
    float _276 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _278 = fma(_270, (*spvDescriptorSet0.fp_c8)._m0[30].w, _276);
    float _280 = in.m_49.x;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = abs(_272);
    float _288 = 0.0 + _286;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = 1.0 / _278;
    float _294 = fma(_290, -2.0, 3.0);
    float _296 = _290 * _290;
    float _298 = _294 * _296;
    float _300 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _302 = in.m_43.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_45.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_43.y;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_45.z;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_43.z;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _334 = fma(_111, (*spvDescriptorSet0.fp_c8)._m0[30].w, _332);
    float _336 = -_274;
    float _338 = _336 + _122;
    float _340 = _93 * _260;
    float _342 = 1.0 / _334;
    float _344 = _340 * _338;
    float _346 = _93 * _246;
    float _348 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _350 = _292 * _348;
    float _352 = _346 * _344;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = _354 * _298;
    float _358 = 0.0 + _356;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _364 = -_350;
    float _366 = fma(_342, _362, _364);
    float _368 = _366 * _300;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = _93 * _284;
    float _374 = _360 * _370;
    float _376 = _374 * _372;
    bool _380 = _376 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _382 = isnan(_376);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _388 = _384 || _386;
    float _390 = in.m_47.x;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_47.y;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_47.z;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = in.m_45.x;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = _376;
    if (!_388)
    {
        discard_fragment();
    }
    float _416 = _116 * _116;
    float _418 = _118 * _118;
    float _420 = _120 * _120;
    float _422 = -_416;
    float _424 = _422 + 1.0;
    float _426 = -_420;
    float _428 = _426 + 1.0;
    float _430 = _93 * _394;
    float _432 = _93 * _400;
    float _434 = -_418;
    float _436 = _434 + 1.0;
    float _438 = _93 * _406;
    float _440 = fma(_424, _430, _416);
    float _442 = _93 * _312;
    float _444 = fma(_436, _432, _418);
    float _446 = fma(_428, _438, _420);
    float _448 = _93 * _412;
    float _450 = _93 * _306;
    float _452 = _93 * _318;
    float _454 = _93 * _324;
    float _456 = _93 * _330;
    float _458 = fma(_448, _450, _440);
    float _460 = fma(_442, _452, _444);
    float _462 = fma(_454, _456, _446);
    if (!_388)
    {
        out.m_52.x = _458;
        out.m_52.y = _460;
        out.m_52.z = _462;
        out.m_52.w = _356;
        return out;
    }
    float _464 = _460 * 0.715200006961822509765625;
    float _466 = in.m_54.w;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_54.x;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = in.m_54.y;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = fma(_458, 0.2125999927520751953125, _464);
    float _486 = in.m_54.z;
    float _488 = gl_FragCoord.w;
    float _490 = _486 * _488;
    float _492 = fma(_462, 0.072200000286102294921875, _484);
    bool _494 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _496 = 1.0 / _492;
    float _498 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_494)
    {
        float _500 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _502 = _350 + _500;
        _498 = _502;
    }
    float _504 = _498;
    float _506 = _496 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = fma(_508, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _512 = _93 * _470;
    float _514 = _93 * _482;
    float _516 = _510 * _512;
    float _518 = 0.0 + _376;
    float _520 = precise::clamp(_518, 0.0, 1.0);
    float _522 = _520;
    if (_494)
    {
        float _524 = _504 * 8.0;
        float _526 = precise::clamp(_524, 0.0, 1.0);
        _414 = _526;
    }
    float _528 = _414;
    float _530 = _93 * _476;
    float _532 = _93 * _490;
    float _534 = fma(_460, _516, _514);
    if (_494)
    {
        float _536 = _520 * _528;
        _522 = _536;
    }
    float _538 = _522;
    float _540 = fma(_458, _516, _530);
    float _542 = fma(_462, _516, _532);
    float _544 = 0.0 + _538;
    float _546 = precise::clamp(_544, 0.0, 1.0);
    out.m_52.x = _540;
    out.m_52.y = _534;
    out.m_52.z = _542;
    out.m_52.w = _546;
    return out;
}

