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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_44 [[user(locn5), flat]];
    float4 m_46 [[user(locn6), flat]];
    float4 m_57 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _64 = gl_FragCoord.w;
    float _66 = in.m_40.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_40.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _64;
    float _80 = _78 * _70;
    float _82 = _78 * _76;
    float2 _449 = float2(_80, _82);
    float2 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_449, float2(0.0), isnan(_449))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_449, float2(0.0), isnan(_449))).xy;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = in.m_42.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_42.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_42.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_44.x;
    float _112 = in.m_40.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_46.y;
    float _120 = in.m_40.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = _78 * _96;
    float _128 = _78 * _102;
    float _130 = _78 * _108;
    float _132 = _110 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _134 = 1.0 / _126;
    float _136 = _110 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _138 = _78 * _116;
    float _140 = _78 * _124;
    float _142 = _128 * _134;
    float _144 = _130 * _134;
    float _146 = rint(_118);
    float _148 = precise::max(_146, 0.0);
    uint _151 = uint(_148);
    uint _153 = clamp(_151, 0u, 65535u);
    float _155 = fma(_136, _90, _138);
    float _157 = fma(_132, _88, _140);
    float2 _556 = float2(_142, _144);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_556, float2(0.0), isnan(_556))).x;
    float3 _568 = float3(_157, _155, float(int(_153)));
    float3 _572 = select(_568, float3(0.0), isnan(_568));
    float4 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _572.xy, uint(rint(_572.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _572.xy, uint(rint(_572.z))).xyzw;
    float _164 = _162.x;
    float _166 = _162.y;
    float _168 = _162.z;
    float _170 = _162.w;
    float _172 = in.m_42.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_48.w;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_50.w;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_52.x;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _198 = _78 * _176;
    float _200 = _198 * _134;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _204 = fma(_200, (*spvDescriptorSet0.fp_c8)._m0[30].w, _202);
    float _206 = _78 * _182;
    float _208 = 1.0 / _204;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _212 = _208 * _210;
    float _214 = in.m_50.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_48.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _228 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[30].w, _226);
    float _230 = _78 * _188;
    float _232 = 1.0 / _228;
    float _234 = -_206;
    float _236 = _170 + _234;
    float _238 = _230 * _236;
    float _240 = 0.0 + _238;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _246 = -_212;
    float _248 = fma(_232, _244, _246);
    float _250 = _248 * _196;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _78 * _194;
    float _256 = _242 * _252;
    float _258 = _256 * _254;
    bool _262 = _258 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _264 = isnan(_258);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _270 = _266 || _268;
    float _272 = in.m_50.x;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_48.y;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_48.x;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_50.z;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    if (!_270)
    {
        discard_fragment();
    }
    float _296 = _78 * _276;
    float _298 = _78 * _282;
    float _300 = _78 * _288;
    float _302 = _78 * _218;
    float _304 = _78 * _224;
    float _306 = _78 * _294;
    float _308 = -_296;
    float _310 = _300 + _308;
    float _312 = -_302;
    float _314 = _298 + _312;
    float _316 = _164 * _164;
    float _318 = -_306;
    float _320 = _304 + _318;
    float _322 = _166 * _166;
    float _324 = _168 * _168;
    float _326 = fma(_316, _310, _296);
    float _328 = fma(_322, _314, _302);
    float _330 = fma(_324, _320, _306);
    if (!_270)
    {
        out.m_55.x = _326;
        out.m_55.y = _328;
        out.m_55.z = _330;
        out.m_55.w = _238;
        return out;
    }
    float _332 = _328 * 0.715200006961822509765625;
    float _334 = in.m_57.w;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_57.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_57.y;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = fma(_326, 0.2125999927520751953125, _332);
    float _354 = in.m_57.z;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = fma(_330, 0.072200000286102294921875, _352);
    bool _362 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _364 = 1.0 / _360;
    float _366 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_362)
    {
        float _368 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _370 = _212 + _368;
        _366 = _370;
    }
    float _372 = _366;
    float _374 = _364 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = fma(_376, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _380 = _78 * _338;
    float _382 = _78 * _350;
    float _384 = _378 * _380;
    float _386 = 0.0 + _258;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _380;
    float _392 = _388;
    if (_362)
    {
        float _394 = _372 * 8.0;
        float _396 = precise::clamp(_394, 0.0, 1.0);
        _390 = _396;
    }
    float _398 = _390;
    float _400 = _78 * _344;
    float _402 = _78 * _358;
    float _404 = fma(_328, _384, _382);
    if (_362)
    {
        float _406 = _388 * _398;
        _392 = _406;
    }
    float _408 = _392;
    float _410 = fma(_326, _384, _400);
    float _412 = fma(_330, _384, _402);
    float _414 = 0.0 + _408;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    out.m_55.x = _410;
    out.m_55.y = _404;
    out.m_55.z = _412;
    out.m_55.w = _416;
    return out;
}

