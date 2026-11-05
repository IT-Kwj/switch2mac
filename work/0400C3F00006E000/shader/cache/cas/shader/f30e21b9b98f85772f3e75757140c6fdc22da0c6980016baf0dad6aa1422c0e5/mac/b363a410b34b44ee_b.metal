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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_42 [[user(locn4), flat]];
    float4 m_65 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_40 [[user(locn7)]];
    float4 m_36 [[user(locn8), flat]];
    float4 m_55 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_57 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = in.m_36.x;
    float _74 = gl_FragCoord.w;
    float _76 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _72 + 1.0;
    float _92 = 1.0 / _74;
    float _94 = _90 * _76;
    float _96 = floor(_94);
    float _98 = rint(_72);
    float _100 = precise::max(_98, 0.0);
    uint _103 = uint(_100);
    uint _105 = clamp(_103, 0u, 65535u);
    float _107 = _92 * _82;
    float _109 = -_96;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c9)._m0[22].x, _90);
    float _113 = _92 * _88;
    float _115 = rint(_111);
    float _117 = precise::max(_115, 0.0);
    uint _119 = uint(_117);
    uint _121 = clamp(_119, 0u, 65535u);
    float3 _663 = float3(_107, _113, float(int(_105)));
    float3 _667 = select(_663, float3(0.0), isnan(_663));
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _667.xy, uint(rint(_667.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _667.xy, uint(rint(_667.z))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float3 _684 = float3(_107, _113, float(int(_121)));
    float3 _686 = select(_684, float3(0.0), isnan(_684));
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _686.xy, uint(rint(_686.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _686.xy, uint(rint(_686.z))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float _144 = in.m_42.y;
    float _146 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _148 = in.m_44.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_46.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_48.w;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_50.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _144 * _146;
    float _174 = _172 * _146;
    float _176 = floor(_174);
    float _178 = -_176;
    float _180 = fma(_178, (*spvDescriptorSet0.fp_c9)._m0[22].y, _172);
    float _182 = _92 * _152;
    float _184 = _92 * _164;
    float _186 = _180 + 9.9999997473787516355514526367188e-05;
    float _188 = floor(_186);
    float _190 = -_188;
    float _192 = _186 + _190;
    float _194 = _92 * _170;
    float _196 = in.m_46.x;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_48.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_46.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_48.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_46.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_48.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = -_132;
    float _234 = _232 + _142;
    float _236 = fma(_192, _234, _132);
    float _238 = _236 * _182;
    float _240 = _92 * _158;
    float _242 = _240 * _238;
    float _244 = _184 * _242;
    float _246 = 0.0 + _244;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _248 * _194;
    bool _254 = _250 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _256 = isnan(_250);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _262 = _258 || _260;
    float _264 = in.m_44.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_44.y;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_44.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    if (!_262)
    {
        discard_fragment();
    }
    float _282 = -_126;
    float _284 = _282 + _136;
    float _286 = -_128;
    float _288 = _286 + _138;
    float _290 = -_130;
    float _292 = _290 + _140;
    float _294 = _92 * _200;
    float _296 = fma(_192, _284, _126);
    float _298 = fma(_192, _288, _128);
    float _300 = _92 * _206;
    float _302 = _92 * _212;
    float _304 = _92 * _218;
    float _306 = _92 * _224;
    float _308 = _92 * _230;
    float _310 = fma(_192, _292, _130);
    float _312 = -_300;
    float _314 = _294 + _312;
    float _316 = _296 * _296;
    float _318 = -_304;
    float _320 = _302 + _318;
    float _322 = -_308;
    float _324 = _306 + _322;
    float _326 = _298 * _298;
    float _328 = _310 * _310;
    float _330 = fma(_316, _314, _300);
    float _332 = _92 * _268;
    float _334 = fma(_326, _320, _304);
    float _336 = fma(_328, _324, _308);
    float _338 = _92 * _274;
    float _340 = _92 * _280;
    float _342 = _330 * _332;
    float _344 = _334 * _338;
    float _346 = _336 * _340;
    if (!_262)
    {
        out.m_53.x = _342;
        out.m_53.y = _344;
        out.m_53.z = _346;
        out.m_53.w = _244;
        return out;
    }
    float _348 = in.m_55.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_55.x;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_55.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = _92 * _352;
    float _368 = _92 * _358;
    float _370 = _92 * _364;
    float _372 = _366 * _366;
    float _374 = in.m_57.x;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = fma(_368, _368, _372);
    float _382 = fma(_370, _370, _380);
    float _384 = rsqrt(_382);
    float _386 = _368 * _384;
    float _388 = _366 * _384;
    float _390 = _370 * _384;
    float _392 = _92 * _378;
    float _394 = abs(_386);
    float _396 = abs(_388);
    float _398 = precise::max(_394, _396);
    float _400 = abs(_390);
    float _402 = precise::max(_400, _398);
    float _404 = 1.0 / _402;
    float _406 = _388 * _404;
    float _408 = -_404;
    float _410 = _390 * _408;
    float _412 = precise::min(_392, 1.0);
    float _414 = _386 * _404;
    float3 _1081 = float3(_414, _406, _410);
    float3 _418 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1081, float3(0.0), isnan(_1081)), level(_412)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1081, float3(0.0), isnan(_1081)), level(_412)).xyz;
    float _420 = _418.x;
    float _422 = _418.y;
    float _424 = _418.z;
    float _426 = in.m_59.y;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = in.m_59.z;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = in.m_59.x;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = in.m_61.y;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = in.m_61.z;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = in.m_61.x;
    float _458 = gl_FragCoord.w;
    float _460 = _456 * _458;
    float _462 = in.m_63.x;
    float _464 = gl_FragCoord.w;
    float _466 = _462 * _464;
    float _468 = in.m_63.w;
    float _470 = gl_FragCoord.w;
    float _472 = _468 * _470;
    float _474 = in.m_63.y;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = in.m_63.z;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = 0.0 + _250;
    float _488 = precise::clamp(_486, 0.0, 1.0);
    float _490 = _92 * _430;
    float _492 = _92 * _436;
    float _494 = _92 * _442;
    bool _496 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _498 = fma(_422, 0.20999999344348907470703125, _490);
    float _500 = fma(_424, 0.20999999344348907470703125, _492);
    float _502 = fma(_420, 0.20999999344348907470703125, _494);
    float _504 = _92 * _448;
    float _506 = _92 * _454;
    float _508 = _92 * _460;
    float _510 = _498 + _504;
    float _512 = _500 + _506;
    float _514 = _502 + _508;
    float _516 = _92 * _478;
    float _518 = _344 * _510;
    float _520 = _346 * _512;
    float _522 = _342 * _514;
    float _524 = _92 * _466;
    float _526 = _92 * _472;
    float _528 = _92 * _484;
    float _530 = fma(_522, _526, _524);
    float _532 = fma(_518, _526, _516);
    float _534 = fma(_520, _526, _528);
    float _536 = _524;
    if (!_496)
    {
        _536 = _488;
    }
    float _538 = _536;
    bool _540 = !_496;
    float _542 = _538;
    if (!_540)
    {
        float _544 = in.m_65.w;
        float _546 = gl_FragCoord.w;
        float _548 = _544 * _546;
        float _550 = in.m_65.z;
        float _552 = gl_FragCoord.w;
        float _554 = _550 * _552;
        float _556 = _92 * _548;
        float _558 = _92 * _554;
        float _560 = 1.0 / _556;
        float _562 = _558 * _560;
        float _564 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _566 = fma(_562, (*spvDescriptorSet0.fp_c8)._m0[30].w, _564);
        float _568 = 1.0 / _566;
        float _570 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _572 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _574 = fma(_568, _570, _572);
        float _576 = _574 * 8.0;
        float _578 = precise::clamp(_576, 0.0, 1.0);
        float _580 = _488 * _578;
        _542 = _580;
    }
    float _582 = _542;
    float _584 = 0.0 + _582;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    out.m_53.x = _530;
    out.m_53.y = _532;
    out.m_53.z = _534;
    out.m_53.w = _586;
    return out;
}

