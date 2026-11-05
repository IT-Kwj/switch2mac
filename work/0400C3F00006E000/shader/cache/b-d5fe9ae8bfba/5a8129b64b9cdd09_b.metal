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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_64 [[color(0)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_51 [[user(locn8), flat]];
    float4 m_66 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_68 [[user(locn11)]];
    float4 m_74 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _81 = gl_FragCoord.w;
    float _83 = in.m_47.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_47.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = 1.0 / _81;
    float _97 = _95 * _87;
    float _99 = _95 * _93;
    float2 _591 = float2(_97, _99);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_591, float2(0.0), isnan(_591))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_591, float2(0.0), isnan(_591))).w;
    float _103 = in.m_49.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_51.z;
    float _111 = in.m_47.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_53.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_49.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_53.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_47.x;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_49.y;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _95 * _107;
    float _149 = rint(_109);
    float _151 = precise::max(_149, 0.0);
    uint _154 = uint(_151);
    uint _156 = clamp(_154, 0u, 65535u);
    float _158 = _95 * _115;
    float _160 = _95 * _121;
    float _162 = _95 * _127;
    float _164 = _95 * _133;
    float _166 = _95 * _139;
    float _168 = _95 * _145;
    float _170 = 1.0 / _147;
    float _172 = _162 * _170;
    float _174 = _168 * _170;
    float3 _698 = float3(_164, _160, float(int(_156)));
    float3 _702 = select(_698, float3(0.0), isnan(_698));
    float3 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _702.xy, uint(rint(_702.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _702.xy, uint(rint(_702.z))).yzw;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float _186 = fma(_101, -0.100000001490116119384765625, _158);
    float2 _718 = float2(_166, _186);
    float _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_718, float2(0.0), isnan(_718))).w;
    float2 _726 = float2(_172, _174);
    float _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_726, float2(0.0), isnan(_726))).x;
    float _192 = in.m_49.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_55.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_57.w;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_59.w;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_61.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = _95 * _196;
    float _224 = _222 * _170;
    float _226 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _228 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _230 = fma(_224, (*spvDescriptorSet0.fp_c8)._m0[30].w, _228);
    float _232 = _95 * _202;
    float _234 = 1.0 / _230;
    float _236 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _238 = _234 * _236;
    float _240 = _188 * _184;
    float _242 = _95 * _208;
    float _244 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _246 = fma(_190, (*spvDescriptorSet0.fp_c8)._m0[30].w, _244);
    float _248 = _240 * _232;
    float _250 = -_242;
    float _252 = _250 + 1.0;
    float _254 = -_242;
    float _256 = _254 + 1.2000000476837158203125;
    float _258 = 1.0 / _246;
    float _260 = precise::max(_252, _248);
    float _262 = precise::min(_256, _260);
    float _264 = _95 * _214;
    float _266 = -_252;
    float _268 = _266 + _262;
    float _270 = _95 * _220;
    float _272 = _268 * 4.99999904632568359375;
    float _274 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _276 = -_238;
    float _278 = fma(_258, _274, _276);
    float _280 = _272 * _264;
    float _282 = _278 * _226;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = 0.0 + _280;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _288 * _284;
    float _292 = _290 * _270;
    bool _296 = _292 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _298 = isnan(_292);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _304 = _300 || _302;
    float _306 = in.m_57.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_57.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_57.z;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = _238;
    if (!_304)
    {
        discard_fragment();
    }
    float _326 = _95 * _310;
    float _328 = _95 * _316;
    float _330 = _95 * _322;
    if (!_304)
    {
        out.m_64.x = _326;
        out.m_64.y = _328;
        out.m_64.z = _330;
        out.m_64.w = _280;
        return out;
    }
    float _332 = in.m_66.y;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_66.x;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = in.m_66.z;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_68.x;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = _95 * _336;
    float _358 = _95 * _342;
    float _360 = _95 * _348;
    float _362 = _95 * _354;
    float _364 = _356 * _356;
    float _366 = fma(_358, _358, _364);
    float _368 = fma(_360, _360, _366);
    float _370 = rsqrt(_368);
    float _372 = _358 * _370;
    float _374 = _356 * _370;
    float _376 = _360 * _370;
    float _378 = abs(_372);
    float _380 = abs(_374);
    float _382 = precise::max(_378, _380);
    float _384 = fma(_180, -0.5, 0.5);
    float _386 = abs(_376);
    float _388 = precise::max(_386, _382);
    float _390 = _384 + _362;
    float _392 = 1.0 / _388;
    float _394 = _372 * _392;
    float _396 = _374 * _392;
    float _398 = -_392;
    float _400 = _376 * _398;
    float _402 = precise::min(_390, 1.0);
    float3 _1036 = float3(_394, _396, _400);
    float3 _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1036, float3(0.0), isnan(_1036)), level(_402)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1036, float3(0.0), isnan(_1036)), level(_402)).xyz;
    float _406 = _404.x;
    float _408 = _404.y;
    float _410 = _404.z;
    float _412 = in.m_70.y;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = in.m_70.x;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = in.m_70.z;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_72.y;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_72.z;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = in.m_72.x;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = in.m_74.x;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = in.m_74.y;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_74.z;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_74.w;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = -_101;
    float _474 = _472 + 1.0;
    bool _476 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _478 = -_182;
    float _480 = fma(_478, _474, 1.0);
    if (_476)
    {
        float _482 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _484 = _238 + _482;
        _324 = _484;
    }
    float _486 = _324;
    float _488 = _486;
    if (_476)
    {
        float _490 = _486 * 8.0;
        float _492 = precise::clamp(_490, 0.0, 1.0);
        _488 = _492;
    }
    float _494 = _488;
    float _496 = _95 * _416;
    float _498 = _95 * _422;
    float _500 = _95 * _428;
    float _502 = _496 * _480;
    float _504 = _498 * _480;
    float _506 = _500 * _480;
    float _508 = _95 * _434;
    float _510 = _95 * _440;
    float _512 = _95 * _452;
    float _514 = _95 * _458;
    float _516 = _95 * _464;
    float _518 = fma(_408, 0.20999999344348907470703125, _502);
    float _520 = fma(_406, 0.20999999344348907470703125, _504);
    float _522 = fma(_410, 0.20999999344348907470703125, _506);
    float _524 = _95 * _446;
    float _526 = _518 + _508;
    float _528 = _95 * _470;
    float _530 = _522 + _510;
    float _532 = _520 + _524;
    float _534 = 0.0 + _292;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = _328 * _526;
    float _540 = _330 * _530;
    float _542 = _326 * _532;
    float _544 = _536;
    if (_476)
    {
        float _546 = _536 * _494;
        _544 = _546;
    }
    float _548 = _544;
    float _550 = fma(_538, _528, _514);
    float _552 = fma(_540, _528, _516);
    float _554 = fma(_542, _528, _512);
    float _556 = 0.0 + _548;
    float _558 = precise::clamp(_556, 0.0, 1.0);
    out.m_64.x = _554;
    out.m_64.y = _550;
    out.m_64.z = _552;
    out.m_64.w = _558;
    return out;
}

