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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _376 = float2(_73, _75);
    float4 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_376, float2(0.0), isnan(_376))).xyzw;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    float _86 = _78.w;
    float _88 = in.m_37.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_39.w;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_41.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = _71 * _92;
    float _108 = _71 * _98;
    float _110 = _86 * _106;
    float _112 = _108 * _110;
    float _114 = _71 * _104;
    float _116 = 0.0 + _112;
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = _118 * _114;
    bool _124 = _120 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _132 = _128 || _130;
    float _134 = in.m_35.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_35.w;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    if (!_132)
    {
        discard_fragment();
    }
    float _146 = _71 * _138;
    float _148 = _71 * _144;
    float2 _481 = float2(_146, _148);
    float3 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_481, float2(0.0), isnan(_481))).xyz;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = in.m_39.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_39.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_43.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_43.y;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_39.z;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_43.z;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = _71 * _182;
    float _198 = _71 * _188;
    float _200 = fma(_80, _80, _154);
    float _202 = fma(_82, _82, _156);
    float _204 = _71 * _164;
    float _206 = _71 * _170;
    float _208 = _71 * _176;
    float _210 = _71 * _194;
    float _212 = fma(_84, _84, _158);
    float _214 = -_196;
    float _216 = _206 + _214;
    float _218 = -_208;
    float _220 = _204 + _218;
    float _222 = -_210;
    float _224 = _198 + _222;
    float _226 = fma(_202, _216, _196);
    float _228 = fma(_200, _220, _208);
    float _230 = fma(_212, _224, _210);
    if (!_132)
    {
        out.m_46.x = _228;
        out.m_46.y = _226;
        out.m_46.z = _230;
        out.m_46.w = _112;
        return out;
    }
    float _232 = _226 * 0.715200006961822509765625;
    float _234 = in.m_48.w;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_48.z;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_48.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = fma(_228, 0.2125999927520751953125, _232);
    float _254 = in.m_48.y;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = fma(_230, 0.072200000286102294921875, _252);
    bool _262 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _264 = 1.0 / _260;
    float _266 = _264 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = _71 * _238;
    float _272 = fma(_268, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _274 = _71 * _244;
    float _276 = _272 * _270;
    float _278 = 0.0 + _120;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _71 * _250;
    float _284 = _71 * _258;
    float _286 = fma(_230, _276, _274);
    float _288 = fma(_228, _276, _282);
    float _290 = fma(_226, _276, _284);
    float _292 = _274;
    if (!_262)
    {
        _292 = _280;
    }
    float _294 = _292;
    bool _296 = !_262;
    float _298 = _294;
    if (!_296)
    {
        float _300 = in.m_50.w;
        float _302 = gl_FragCoord.w;
        float _304 = _300 * _302;
        float _306 = in.m_50.z;
        float _308 = gl_FragCoord.w;
        float _310 = _306 * _308;
        float _312 = _71 * _304;
        float _314 = _71 * _310;
        float _316 = 1.0 / _312;
        float _318 = _314 * _316;
        float _320 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _322 = fma(_318, (*spvDescriptorSet0.fp_c8)._m0[30].w, _320);
        float _324 = 1.0 / _322;
        float _326 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _328 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _330 = fma(_324, _326, _328);
        float _332 = _330 * 8.0;
        float _334 = precise::clamp(_332, 0.0, 1.0);
        float _336 = _280 * _334;
        _298 = _336;
    }
    float _338 = _298;
    float _340 = 0.0 + _338;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    out.m_46.x = _288;
    out.m_46.y = _290;
    out.m_46.z = _286;
    out.m_46.w = _342;
    return out;
}

