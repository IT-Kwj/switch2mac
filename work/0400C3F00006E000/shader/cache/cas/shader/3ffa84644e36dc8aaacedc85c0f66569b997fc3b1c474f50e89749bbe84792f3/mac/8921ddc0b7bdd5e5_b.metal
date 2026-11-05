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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_45 [[user(locn5), flat]];
    float4 m_37 [[user(locn6)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _409 = float2(_77, _79);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_409, float2(0.0), isnan(_409))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_39.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_41.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_43.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = _75 * _96;
    float _112 = _75 * _108;
    float _114 = _90 * _110;
    float _116 = _75 * _102;
    float _118 = 0.0 + _114;
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = _120 * _116;
    bool _126 = _122 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _128 = isnan(_122);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _134 = _130 || _132;
    float _136 = in.m_43.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    if (!_134)
    {
        discard_fragment();
    }
    float _142 = _75 * _140;
    float2 _501 = float2(_142, _112);
    float2 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_501, float2(0.0), isnan(_501))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_501, float2(0.0), isnan(_501))).xy;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = in.m_45.x;
    float _154 = in.m_43.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_43.w;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _152 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _168 = _75 * _158;
    float _170 = _152 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _172 = _75 * _164;
    float _174 = fma(_170, _150, _172);
    float _176 = fma(_166, _148, _168);
    float2 _552 = float2(_176, _174);
    float3 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_552, float2(0.0), isnan(_552))).xyz;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = in.m_39.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_47.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_39.y;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_47.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_39.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_47.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = _84 * _84;
    float _226 = _86 * _86;
    float _228 = _88 * _88;
    float _230 = _75 * _198;
    float _232 = _75 * _204;
    float _234 = _75 * _216;
    float _236 = fma(_184, _184, _226);
    float _238 = fma(_182, _182, _224);
    float _240 = _75 * _192;
    float _242 = _75 * _210;
    float _244 = _75 * _222;
    float _246 = fma(_186, _186, _228);
    float _248 = -_230;
    float _250 = _240 + _248;
    float _252 = -_242;
    float _254 = _232 + _252;
    float _256 = -_244;
    float _258 = _234 + _256;
    float _260 = fma(_238, _250, _230);
    float _262 = fma(_236, _254, _242);
    float _264 = fma(_246, _258, _244);
    if (!_134)
    {
        out.m_50.x = _260;
        out.m_50.y = _262;
        out.m_50.z = _264;
        out.m_50.w = _114;
        return out;
    }
    float _266 = _262 * 0.715200006961822509765625;
    float _268 = in.m_52.w;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_52.z;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_52.x;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = fma(_260, 0.2125999927520751953125, _266);
    float _288 = in.m_52.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_264, 0.072200000286102294921875, _286);
    bool _296 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _298 = 1.0 / _294;
    float _300 = _298 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    float _304 = _75 * _272;
    float _306 = fma(_302, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _308 = _75 * _278;
    float _310 = _306 * _304;
    float _312 = 0.0 + _122;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = _75 * _284;
    float _318 = _75 * _292;
    float _320 = fma(_264, _310, _308);
    float _322 = fma(_260, _310, _316);
    float _324 = fma(_262, _310, _318);
    float _326 = _308;
    if (!_296)
    {
        _326 = _314;
    }
    float _328 = _326;
    bool _330 = !_296;
    float _332 = _328;
    if (!_330)
    {
        float _334 = in.m_54.w;
        float _336 = gl_FragCoord.w;
        float _338 = _334 * _336;
        float _340 = in.m_54.z;
        float _342 = gl_FragCoord.w;
        float _344 = _340 * _342;
        float _346 = _75 * _338;
        float _348 = _75 * _344;
        float _350 = 1.0 / _346;
        float _352 = _348 * _350;
        float _354 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _356 = fma(_352, (*spvDescriptorSet0.fp_c8)._m0[30].w, _354);
        float _358 = 1.0 / _356;
        float _360 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _362 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _364 = fma(_358, _360, _362);
        float _366 = _364 * 8.0;
        float _368 = precise::clamp(_366, 0.0, 1.0);
        float _370 = _314 * _368;
        _332 = _370;
    }
    float _372 = _332;
    float _374 = 0.0 + _372;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    out.m_50.x = _322;
    out.m_50.y = _324;
    out.m_50.z = _320;
    out.m_50.w = _376;
    return out;
}

