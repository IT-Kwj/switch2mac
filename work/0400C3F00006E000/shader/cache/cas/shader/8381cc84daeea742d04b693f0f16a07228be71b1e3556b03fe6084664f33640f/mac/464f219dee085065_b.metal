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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_49 [[user(locn4), flat]];
    float4 m_47 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_43 [[user(locn7), flat]];
    float4 m_60 [[user(locn8)]];
    float4 m_66 [[user(locn9)]];
    float4 m_62 [[user(locn10)]];
    float4 m_68 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _75 = gl_FragCoord.w;
    float _77 = in.m_43.x;
    float _79 = in.m_45.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _87 = in.m_45.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_45.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_47.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_47.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = 1.0 / _75;
    float _113 = _77 + 1.0;
    float _115 = _113 * _85;
    float _117 = rint(_77);
    float _119 = precise::max(_117, 0.0);
    uint _122 = uint(_119);
    uint _124 = clamp(_122, 0u, 65535u);
    float _126 = floor(_115);
    float _128 = _111 * _83;
    float _130 = _111 * _103;
    float _132 = 1.0 / _128;
    float _134 = -_126;
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c9)._m0[22].x, _113);
    float _138 = _111 * _91;
    float _140 = _111 * _97;
    float _142 = rint(_136);
    float _144 = precise::max(_142, 0.0);
    uint _146 = uint(_144);
    uint _148 = clamp(_146, 0u, 65535u);
    float _150 = _138 * _132;
    float _152 = _140 * _132;
    float _154 = _111 * _109;
    float2 _625 = float2(_150, _152);
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_625, float2(0.0), isnan(_625))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_625, float2(0.0), isnan(_625))).x;
    float3 _638 = float3(_130, _154, float(int(_124)));
    float3 _642 = select(_638, float3(0.0), isnan(_638));
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _642.xy, uint(rint(_642.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _642.xy, uint(rint(_642.z))).w;
    float3 _651 = float3(_130, _154, float(int(_148)));
    float3 _653 = select(_651, float3(0.0), isnan(_651));
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _653.xy, uint(rint(_653.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _653.xy, uint(rint(_653.z))).w;
    float _162 = in.m_49.y;
    float _164 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _166 = in.m_45.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_51.w;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_53.w;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_55.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = _162 * _164;
    float _192 = _190 * _164;
    float _194 = floor(_192);
    float _196 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _198 = -_194;
    float _200 = fma(_198, (*spvDescriptorSet0.fp_c9)._m0[22].y, _190);
    float _202 = _200 + 9.9999997473787516355514526367188e-05;
    float _204 = _111 * _170;
    float _206 = floor(_202);
    float _208 = _204 * _132;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _212 = fma(_208, (*spvDescriptorSet0.fp_c8)._m0[30].w, _210);
    float _214 = 1.0 / _212;
    float _216 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _218 = _214 * _216;
    float _220 = in.m_51.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _228 = fma(_156, (*spvDescriptorSet0.fp_c8)._m0[30].w, _226);
    float _230 = -_206;
    float _232 = _202 + _230;
    float _234 = _111 * _176;
    float _236 = 1.0 / _228;
    float _238 = -_158;
    float _240 = _238 + _160;
    float _242 = fma(_232, _240, _158);
    float _244 = _111 * _188;
    float _246 = _242 * _234;
    float _248 = _111 * _182;
    float _250 = _248 * _246;
    float _252 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _254 = -_218;
    float _256 = fma(_236, _252, _254);
    float _258 = 0.0 + _250;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _256 * _196;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _260 * _264;
    float _268 = _266 * _244;
    bool _272 = _268 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _274 = isnan(_268);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _280 = _276 || _278;
    float _282 = in.m_51.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_51.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = _218;
    if (!_280)
    {
        discard_fragment();
    }
    float _296 = _111 * _224;
    float _298 = _111 * _286;
    float _300 = _111 * _292;
    if (!_280)
    {
        out.m_58.x = _298;
        out.m_58.y = _300;
        out.m_58.z = _296;
        out.m_58.w = _250;
        return out;
    }
    float _302 = in.m_60.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_60.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_60.z;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = _111 * _306;
    float _322 = _111 * _312;
    float _324 = _111 * _318;
    float _326 = _320 * _320;
    float _328 = in.m_62.x;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = fma(_322, _322, _326);
    float _336 = fma(_324, _324, _334);
    float _338 = rsqrt(_336);
    float _340 = _322 * _338;
    float _342 = _320 * _338;
    float _344 = _324 * _338;
    float _346 = _111 * _332;
    float _348 = abs(_340);
    float _350 = abs(_342);
    float _352 = precise::max(_348, _350);
    float _354 = precise::min(_346, 1.0);
    float _356 = abs(_344);
    float _358 = precise::max(_356, _352);
    float _360 = 1.0 / _358;
    float _362 = -_360;
    float _364 = _344 * _362;
    float _366 = _340 * _360;
    float _368 = _342 * _360;
    float3 _957 = float3(_366, _368, _364);
    float3 _372 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_957, float3(0.0), isnan(_957)), level(_354)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_957, float3(0.0), isnan(_957)), level(_354)).xyz;
    float _374 = _372.x;
    float _376 = _372.y;
    float _378 = _372.z;
    float _380 = in.m_64.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_64.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_64.y;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_66.z;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_66.x;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = in.m_66.y;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = in.m_68.x;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_68.y;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_68.z;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = in.m_68.w;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    bool _440 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_440)
    {
        float _442 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _444 = _218 + _442;
        _294 = _444;
    }
    float _446 = _294;
    float _448 = _446;
    if (_440)
    {
        float _450 = _446 * 8.0;
        float _452 = precise::clamp(_450, 0.0, 1.0);
        _448 = _452;
    }
    float _454 = _448;
    float _456 = _111 * _384;
    float _458 = _111 * _390;
    float _460 = _111 * _402;
    float _462 = _111 * _408;
    float _464 = _111 * _414;
    float _466 = _111 * _426;
    float _468 = fma(_374, 0.20999999344348907470703125, _456);
    float _470 = _111 * _396;
    float _472 = fma(_378, 0.20999999344348907470703125, _458);
    float _474 = _111 * _420;
    float _476 = _468 + _462;
    float _478 = fma(_376, 0.20999999344348907470703125, _470);
    float _480 = _472 + _460;
    float _482 = 0.0 + _268;
    float _484 = precise::clamp(_482, 0.0, 1.0);
    float _486 = _111 * _432;
    float _488 = _478 + _464;
    float _490 = _111 * _438;
    float _492 = _298 * _476;
    float _494 = _296 * _480;
    float _496 = _300 * _488;
    float _498 = _484;
    if (_440)
    {
        float _500 = _484 * _454;
        _498 = _500;
    }
    float _502 = _498;
    float _504 = fma(_492, _490, _474);
    float _506 = fma(_494, _490, _486);
    float _508 = fma(_496, _490, _466);
    float _510 = 0.0 + _502;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    out.m_58.x = _504;
    out.m_58.y = _508;
    out.m_58.z = _506;
    out.m_58.w = _512;
    return out;
}

