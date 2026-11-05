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
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_38 [[user(locn6), flat]];
    float4 m_51 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_38.x;
    float _72 = in.m_40.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _68;
    float _86 = rint(_70);
    float _88 = precise::max(_86, 0.0);
    uint _91 = uint(_88);
    uint _93 = clamp(_91, 0u, 65535u);
    float _95 = _84 * _76;
    float _97 = _84 * _82;
    float3 _528 = float3(_95, _97, float(int(_93)));
    float3 _532 = select(_528, float3(0.0), isnan(_528));
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _532.xy, uint(rint(_532.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _532.xy, uint(rint(_532.z))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = in.m_42.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_44.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = _84 * _114;
    float _124 = _122 + (-1.0);
    float _126 = in.m_46.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_46.z;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_42.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_42.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_42.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = _84 * _130;
    float _158 = _108 + _124;
    float _160 = _84 * _120;
    float _162 = _158 * 2.0;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = _164 * _160;
    bool _170 = _166 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _172 = isnan(_166);
    bool _174 = _170 || _172;
    bool _176 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _178 = _174 || _176;
    float _180 = in.m_46.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    if (!_178)
    {
        discard_fragment();
    }
    float _186 = _102 * _102;
    float _188 = _104 * _104;
    float _190 = _106 * _106;
    float _192 = _84 * _136;
    float _194 = -_186;
    float _196 = _194 + 1.0;
    float _198 = -_188;
    float _200 = _198 + 1.0;
    float _202 = -_190;
    float _204 = _202 + 1.0;
    float _206 = _156 * _200;
    float _208 = _192 * _204;
    float _210 = _84 * _142;
    float _212 = _84 * _148;
    float _214 = _84 * _184;
    float _216 = fma(_188, _212, _206);
    float _218 = _214 * _196;
    float _220 = _84 * _154;
    float _222 = fma(_186, _210, _218);
    float _224 = fma(_190, _220, _208);
    if (!_178)
    {
        out.m_49.x = _222;
        out.m_49.y = _216;
        out.m_49.z = _224;
        out.m_49.w = _164;
        return out;
    }
    float _226 = in.m_51.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_51.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_51.z;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_53.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = _84 * _230;
    float _252 = _84 * _236;
    float _254 = _84 * _242;
    float _256 = _250 * _250;
    float _258 = fma(_252, _252, _256);
    float _260 = fma(_254, _254, _258);
    float _262 = rsqrt(_260);
    float _264 = _252 * _262;
    float _266 = _250 * _262;
    float _268 = _254 * _262;
    float _270 = abs(_264);
    float _272 = abs(_266);
    float _274 = precise::max(_270, _272);
    float _276 = abs(_268);
    float _278 = precise::max(_276, _274);
    float _280 = _84 * _248;
    float _282 = 1.0 / _278;
    float _284 = _266 * _282;
    float _286 = -_282;
    float _288 = _268 * _286;
    float _290 = precise::min(_280, 1.0);
    float _292 = _264 * _282;
    float3 _807 = float3(_292, _284, _288);
    float3 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_807, float3(0.0), isnan(_807)), level(_290)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_807, float3(0.0), isnan(_807)), level(_290)).xyz;
    float _298 = _296.x;
    float _300 = _296.y;
    float _302 = _296.z;
    float _304 = in.m_55.y;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_55.x;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_55.z;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_57.z;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_57.x;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_57.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_59.w;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_59.z;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = in.m_59.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_59.y;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = -_280;
    float _366 = _364 + 1.0;
    float _368 = 0.0 + _166;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = _366 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _374 = _84 * _308;
    float _376 = _84 * _314;
    float _378 = _84 * _320;
    float _380 = _84 * _344;
    float _382 = _84 * _350;
    float _384 = _84 * _356;
    float _386 = fma(_300, 0.20999999344348907470703125, _374);
    float _388 = fma(_298, 0.20999999344348907470703125, _376);
    float _390 = _372 * 0.02624999918043613433837890625;
    float _392 = fma(_302, 0.20999999344348907470703125, _378);
    bool _394 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _396 = _84 * _326;
    float _398 = fma(_390, (*spvDescriptorSet0.fp_c15)._m0[17].x, _388);
    float _400 = fma(_390, (*spvDescriptorSet0.fp_c15)._m0[17].y, _386);
    float _402 = fma(_390, (*spvDescriptorSet0.fp_c15)._m0[17].z, _392);
    float _404 = _84 * _332;
    float _406 = _84 * _338;
    float _408 = _402 + _396;
    float _410 = _398 + _404;
    float _412 = _400 + _406;
    float _414 = _84 * _362;
    float _416 = _224 * _408;
    float _418 = _222 * _410;
    float _420 = _216 * _412;
    float _422 = fma(_416, _380, _382);
    float _424 = fma(_418, _380, _384);
    float _426 = fma(_420, _380, _414);
    float _428 = _382;
    if (!_394)
    {
        _428 = _370;
    }
    float _430 = _428;
    bool _432 = !_394;
    float _434 = _430;
    if (!_432)
    {
        float _436 = in.m_61.w;
        float _438 = gl_FragCoord.w;
        float _440 = _436 * _438;
        float _442 = in.m_61.z;
        float _444 = gl_FragCoord.w;
        float _446 = _442 * _444;
        float _448 = _84 * _440;
        float _450 = _84 * _446;
        float _452 = 1.0 / _448;
        float _454 = _450 * _452;
        float _456 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _458 = fma(_454, (*spvDescriptorSet0.fp_c8)._m0[30].w, _456);
        float _460 = 1.0 / _458;
        float _462 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _464 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _466 = fma(_460, _462, _464);
        float _468 = _466 * 8.0;
        float _470 = precise::clamp(_468, 0.0, 1.0);
        float _472 = _370 * _470;
        _434 = _472;
    }
    float _474 = _434;
    float _476 = 0.0 + _474;
    float _478 = precise::clamp(_476, 0.0, 1.0);
    out.m_49.x = _424;
    out.m_49.y = _426;
    out.m_49.z = _422;
    out.m_49.w = _478;
    return out;
}

