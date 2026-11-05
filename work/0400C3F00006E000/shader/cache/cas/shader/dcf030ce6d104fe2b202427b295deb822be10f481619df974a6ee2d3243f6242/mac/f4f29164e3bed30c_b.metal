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
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_38 [[user(locn6), flat]];
    float4 m_51 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = in.m_40.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _66;
    float _84 = rint(_68);
    float _86 = precise::max(_84, 0.0);
    uint _89 = uint(_86);
    uint _91 = clamp(_89, 0u, 65535u);
    float _93 = _82 * _74;
    float _95 = _82 * _80;
    float3 _488 = float3(_93, _95, float(int(_91)));
    float3 _492 = select(_488, float3(0.0), isnan(_488));
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _492.xy, uint(rint(_492.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _492.xy, uint(rint(_492.z))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float _108 = in.m_42.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_44.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_42.x;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = _82 * _112;
    float _128 = in.m_42.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_46.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_42.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_46.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _82 * _124;
    float _154 = _82 * _132;
    float _156 = _82 * _138;
    float _158 = _82 * _150;
    float _160 = -_156;
    float _162 = _154 + _160;
    float _164 = _106 * _126;
    float _166 = _82 * _118;
    float _168 = 0.0 + _164;
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = _170 * _166;
    bool _176 = _172 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _178 = isnan(_172);
    bool _180 = _176 || _178;
    bool _182 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _184 = _180 || _182;
    float _186 = in.m_46.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    if (!_184)
    {
        discard_fragment();
    }
    float _192 = _82 * _144;
    float _194 = fma(_102, _162, _156);
    float _196 = -_158;
    float _198 = _192 + _196;
    float _200 = fma(_104, _198, _158);
    float _202 = _82 * _190;
    float _204 = -_202;
    float _206 = _152 + _204;
    float _208 = fma(_100, _206, _202);
    if (!_184)
    {
        out.m_49.x = _208;
        out.m_49.y = _194;
        out.m_49.z = _200;
        out.m_49.w = _164;
        return out;
    }
    float _210 = in.m_51.y;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_51.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_51.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = _82 * _214;
    float _230 = _82 * _220;
    float _232 = _82 * _226;
    float _234 = _228 * _228;
    float _236 = fma(_230, _230, _234);
    float _238 = fma(_232, _232, _236);
    float _240 = rsqrt(_238);
    float _242 = _230 * _240;
    float _244 = _228 * _240;
    float _246 = _232 * _240;
    float _248 = abs(_242);
    float _250 = abs(_244);
    float _252 = precise::max(_248, _250);
    float _254 = abs(_246);
    float _256 = precise::max(_254, _252);
    float _258 = 1.0 / _256;
    float _260 = -_258;
    float _262 = _246 * _260;
    float _264 = _242 * _258;
    float _266 = _244 * _258;
    float3 _736 = float3(_264, _266, _262);
    float3 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_736, float3(0.0), isnan(_736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_736, float3(0.0), isnan(_736)), level(0.0)).xyz;
    float _272 = _270.x;
    float _274 = _270.y;
    float _276 = _270.z;
    float _278 = in.m_53.y;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_53.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_53.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_55.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_55.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_55.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_57.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_57.w;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_57.y;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_57.z;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = _82 * _282;
    float _340 = _82 * _288;
    float _342 = _82 * _294;
    bool _344 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _346 = fma(_274, 0.20999999344348907470703125, _338);
    float _348 = fma(_276, 0.20999999344348907470703125, _340);
    float _350 = _82 * _300;
    float _352 = fma(_272, 0.20999999344348907470703125, _342);
    float _354 = _82 * _306;
    float _356 = _82 * _312;
    float _358 = _346 + _350;
    float _360 = _82 * _336;
    float _362 = _348 + _354;
    float _364 = _352 + _356;
    float _366 = _194 * _358;
    float _368 = 0.0 + _172;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = _200 * _362;
    float _374 = _208 * _364;
    float _376 = _82 * _318;
    float _378 = _82 * _324;
    float _380 = _82 * _330;
    float _382 = fma(_374, _378, _376);
    float _384 = fma(_366, _378, _380);
    float _386 = fma(_372, _378, _360);
    float _388 = _376;
    if (!_344)
    {
        _388 = _370;
    }
    float _390 = _388;
    bool _392 = !_344;
    float _394 = _390;
    if (!_392)
    {
        float _396 = in.m_59.w;
        float _398 = gl_FragCoord.w;
        float _400 = _396 * _398;
        float _402 = in.m_59.z;
        float _404 = gl_FragCoord.w;
        float _406 = _402 * _404;
        float _408 = _82 * _400;
        float _410 = _82 * _406;
        float _412 = 1.0 / _408;
        float _414 = _410 * _412;
        float _416 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _418 = fma(_414, (*spvDescriptorSet0.fp_c8)._m0[30].w, _416);
        float _420 = 1.0 / _418;
        float _422 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _424 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _426 = fma(_420, _422, _424);
        float _428 = _426 * 8.0;
        float _430 = precise::clamp(_428, 0.0, 1.0);
        float _432 = _370 * _430;
        _394 = _432;
    }
    float _434 = _394;
    float _436 = 0.0 + _434;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    out.m_49.x = _382;
    out.m_49.y = _384;
    out.m_49.z = _386;
    out.m_49.w = _438;
    return out;
}

