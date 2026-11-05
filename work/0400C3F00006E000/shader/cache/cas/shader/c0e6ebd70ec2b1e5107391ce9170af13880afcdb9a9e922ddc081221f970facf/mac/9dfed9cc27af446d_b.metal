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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5), flat]];
    float4 m_51 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _60 = gl_FragCoord.w;
    float _62 = in.m_38.y;
    float _64 = in.m_40.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_40.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _60;
    float _90 = rint(_62);
    float _92 = precise::max(_90, 0.0);
    uint _95 = uint(_92);
    uint _97 = clamp(_95, 0u, 65535u);
    float _99 = _88 * _68;
    float _101 = _88 * _74;
    float _103 = _88 * _80;
    float _105 = _88 * _86;
    float3 _442 = float3(_99, _105, float(int(_97)));
    float3 _446 = select(_442, float3(0.0), isnan(_442));
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _446.xy, uint(rint(_446.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _446.xy, uint(rint(_446.z))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float2 _461 = float2(_101, _103);
    float4 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_461, float2(0.0), isnan(_461))).xyzw;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float _126 = _118.w;
    float _128 = in.m_42.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_44.w;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_46.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = _88 * _132;
    float _148 = _88 * _138;
    float _150 = _88 * _144;
    float _152 = in.m_42.y;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_44.y;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_44.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_42.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_44.z;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = _88 * _180;
    float _184 = -_146;
    float _186 = fma(_126, _116, _184);
    float _188 = _148 * _186;
    float _190 = 0.0 + _188;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = _192 * _150;
    bool _198 = _194 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _200 = isnan(_194);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _206 = _202 || _204;
    float _208 = in.m_42.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    if (!_206)
    {
        discard_fragment();
    }
    float _214 = _110 * _110;
    float _216 = _120 * _120;
    float _218 = _112 * _112;
    float _220 = _122 * _122;
    float _222 = _124 * _124;
    float _224 = _216 * _214;
    float _226 = _114 * _114;
    float _228 = _220 * _218;
    float _230 = _88 * _156;
    float _232 = _88 * _162;
    float _234 = _88 * _168;
    float _236 = _88 * _174;
    float _238 = _222 * _226;
    float _240 = -_232;
    float _242 = _230 + _240;
    float _244 = _88 * _212;
    float _246 = -_182;
    float _248 = _236 + _246;
    float _250 = fma(_228, _242, _232);
    float _252 = -_234;
    float _254 = _244 + _252;
    float _256 = fma(_238, _248, _182);
    float _258 = fma(_224, _254, _234);
    if (!_206)
    {
        out.m_49.x = _258;
        out.m_49.y = _250;
        out.m_49.z = _256;
        out.m_49.w = _188;
        return out;
    }
    float _260 = _250 * 0.715200006961822509765625;
    float _262 = in.m_51.w;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_51.z;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_51.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = fma(_258, 0.2125999927520751953125, _260);
    float _282 = in.m_51.y;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = fma(_256, 0.072200000286102294921875, _280);
    bool _290 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _292 = 1.0 / _288;
    float _294 = _292 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = fma(_296, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _300 = _88 * _266;
    float _302 = 0.0 + _194;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _88 * _272;
    float _308 = _88 * _278;
    float _310 = _298 * _300;
    float _312 = _88 * _286;
    float _314 = fma(_256, _310, _306);
    float _316 = fma(_258, _310, _308);
    float _318 = fma(_250, _310, _312);
    float _320 = _306;
    if (!_290)
    {
        _320 = _304;
    }
    float _322 = _320;
    bool _324 = !_290;
    float _326 = _322;
    if (!_324)
    {
        float _328 = in.m_53.w;
        float _330 = gl_FragCoord.w;
        float _332 = _328 * _330;
        float _334 = in.m_53.z;
        float _336 = gl_FragCoord.w;
        float _338 = _334 * _336;
        float _340 = _88 * _332;
        float _342 = _88 * _338;
        float _344 = 1.0 / _340;
        float _346 = _342 * _344;
        float _348 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _350 = fma(_346, (*spvDescriptorSet0.fp_c8)._m0[30].w, _348);
        float _352 = 1.0 / _350;
        float _354 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _356 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _358 = fma(_352, _354, _356);
        float _360 = _358 * 8.0;
        float _362 = precise::clamp(_360, 0.0, 1.0);
        float _364 = _304 * _362;
        _326 = _364;
    }
    float _366 = _326;
    float _368 = 0.0 + _366;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    out.m_49.x = _316;
    out.m_49.y = _318;
    out.m_49.z = _314;
    out.m_49.w = _370;
    return out;
}

