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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_49 [[user(locn6), flat]];
    float4 m_60 [[user(locn7)]];
    float4 m_66 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _75 = gl_FragCoord.w;
    float _77 = in.m_45.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_45.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_45.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_47.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_47.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_49.x;
    float _109 = in.m_47.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_47.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = 1.0 / _75;
    float _123 = _121 * _81;
    float _125 = _121 * _87;
    float _127 = _121 * _93;
    float _129 = _121 * _99;
    float _131 = 1.0 / _123;
    float _133 = _121 * _119;
    float _135 = rint(_107);
    float _137 = precise::max(_135, 0.0);
    uint _140 = uint(_137);
    uint _142 = clamp(_140, 0u, 65535u);
    float _144 = _125 * _131;
    float _146 = _127 * _131;
    float _148 = _121 * _105;
    float _150 = _121 * _113;
    float2 _609 = float2(_144, _146);
    float _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_609, float2(0.0), isnan(_609))).x;
    float2 _619 = float2(_150, _148);
    float _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_619, float2(0.0), isnan(_619))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_619, float2(0.0), isnan(_619))).w;
    float3 _630 = float3(_133, _129, float(int(_142)));
    float3 _634 = select(_630, float3(0.0), isnan(_630));
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _634.xy, uint(rint(_634.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _634.xy, uint(rint(_634.z))).w;
    float _158 = in.m_45.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_51.w;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_53.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = _121 * _162;
    float _178 = _176 * _131;
    float _180 = _121 * _168;
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _184 = fma(_178, (*spvDescriptorSet0.fp_c8)._m0[30].w, _182);
    float _186 = in.m_55.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = fma(_180, 2.0, -1.0);
    float _194 = 1.0 / _184;
    float _196 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _198 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _200 = _194 * _198;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _204 = fma(_152, (*spvDescriptorSet0.fp_c8)._m0[30].w, _202);
    float _206 = _154 + _192;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = 1.0 / _204;
    float _212 = fma(_208, -2.0, 3.0);
    float _214 = _208 * _208;
    float _216 = _121 * _174;
    float _218 = _212 * _214;
    float _220 = _156 * _218;
    float _222 = _220 * _216;
    float _224 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _226 = -_200;
    float _228 = fma(_210, _224, _226);
    float _230 = _121 * _190;
    float _232 = 0.0 + _222;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _228 * _196;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _234 * _238;
    float _242 = _240 * _230;
    bool _246 = _242 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _248 = isnan(_242);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _254 = _250 || _252;
    float _256 = in.m_51.y;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_51.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_51.z;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    if (!_254)
    {
        discard_fragment();
    }
    float _274 = _121 * _260;
    float _276 = _121 * _266;
    float _278 = _121 * _272;
    if (!_254)
    {
        out.m_58.x = _276;
        out.m_58.y = _274;
        out.m_58.z = _278;
        out.m_58.w = _222;
        return out;
    }
    float _280 = in.m_60.y;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_60.x;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_60.z;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_62.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = _121 * _284;
    float _306 = _121 * _290;
    float _308 = _121 * _296;
    float _310 = _121 * _302;
    float _312 = _304 * _304;
    float _314 = fma(_306, _306, _312);
    float _316 = precise::min(_310, 1.0);
    float _318 = fma(_308, _308, _314);
    float _320 = rsqrt(_318);
    float _322 = _306 * _320;
    float _324 = _304 * _320;
    float _326 = _308 * _320;
    float _328 = abs(_322);
    float _330 = abs(_324);
    float _332 = precise::max(_328, _330);
    float _334 = abs(_326);
    float _336 = precise::max(_334, _332);
    float _338 = 1.0 / _336;
    float _340 = -_338;
    float _342 = _326 * _340;
    float _344 = _322 * _338;
    float _346 = _324 * _338;
    float3 _917 = float3(_344, _346, _342);
    float3 _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_917, float3(0.0), isnan(_917)), level(_316)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_917, float3(0.0), isnan(_917)), level(_316)).xyz;
    float _352 = _350.x;
    float _354 = _350.y;
    float _356 = _350.z;
    float _358 = in.m_64.y;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_66.x;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_64.x;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_66.y;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_64.z;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_66.z;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_68.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = in.m_68.y;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = in.m_68.z;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = in.m_68.w;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    bool _418 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _420 = (*spvDescriptorSet0.fp_c15)._m0[2].z * 1.41398727893829345703125;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _121 * _362;
    float _426 = _121 * _368;
    float _428 = _121 * _374;
    float _430 = _121 * _380;
    float _432 = _121 * _386;
    float _434 = _121 * _392;
    float _436 = _121 * _398;
    float _438 = fma(_422, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _440 = _121 * _404;
    float _442 = _121 * _410;
    float _444 = _121 * _416;
    float _446 = fma(_354, 0.20999999344348907470703125, _424);
    float _448 = fma(_352, 0.20999999344348907470703125, _428);
    float _450 = fma(_356, 0.20999999344348907470703125, _432);
    float _452 = _446 + _430;
    float _454 = _446;
    if (_418)
    {
        float _456 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _458 = _200 + _456;
        _454 = _458;
    }
    float _460 = _454;
    float _462 = _448 + _426;
    float _464 = _438 * 0.699999988079071044921875;
    float _466 = _450 + _434;
    float _468 = 0.0 + _242;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = _438 * 0.800000011920928955078125;
    float _474 = _460;
    float _476 = _470;
    if (_418)
    {
        float _478 = _460 * 8.0;
        float _480 = precise::clamp(_478, 0.0, 1.0);
        _474 = _480;
    }
    float _482 = _474;
    float _484 = fma(_276, _462, _464);
    float _486 = fma(_274, _452, _464);
    float _488 = fma(_278, _466, _472);
    if (_418)
    {
        float _490 = _470 * _482;
        _476 = _490;
    }
    float _492 = _476;
    float _494 = fma(_484, _444, _436);
    float _496 = fma(_486, _444, _440);
    float _498 = fma(_488, _444, _442);
    float _500 = 0.0 + _492;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    out.m_58.x = _494;
    out.m_58.y = _496;
    out.m_58.z = _498;
    out.m_58.w = _502;
    return out;
}

