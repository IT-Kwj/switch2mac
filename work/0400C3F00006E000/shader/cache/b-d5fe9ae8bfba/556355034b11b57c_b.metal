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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _59;
    float _87 = _85 * _65;
    float _89 = _85 * _71;
    float _91 = _85 * _77;
    float _93 = _85 * _83;
    float2 _421 = float2(_87, _89);
    float4 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421))).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float2 _440 = float2(_91, _93);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_440, float2(0.0), isnan(_440))).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_39.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_41.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_43.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_45.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = _85 * _120;
    float _142 = _104 * _114;
    float _144 = _142 * _140;
    float _146 = _85 * _126;
    float _148 = _85 * _132;
    float _150 = _146 * _144;
    float _152 = _148 * _150;
    float _154 = _85 * _138;
    float _156 = 0.0 + _152;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _158 * _154;
    bool _164 = _160 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _166 = isnan(_160);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _172 = _168 || _170;
    float _174 = in.m_47.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_47.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    if (!_172)
    {
        discard_fragment();
    }
    float _186 = _85 * _178;
    float _188 = _85 * _184;
    float2 _557 = float2(_186, _188);
    float3 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_557, float2(0.0), isnan(_557))).xyz;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = in.m_41.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_43.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_41.y;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_43.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_41.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_43.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_39.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_39.y;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_39.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = _100 * _100;
    float _256 = _98 * _98;
    float _258 = _102 * _102;
    float _260 = _85 * _204;
    float _262 = _85 * _216;
    float _264 = _85 * _240;
    float _266 = _85 * _246;
    float _268 = _196 * _196;
    float _270 = _194 * _194;
    float _272 = _198 * _198;
    float _274 = fma(_254, _110, _268);
    float _276 = fma(_256, _108, _270);
    float _278 = _85 * _210;
    float _280 = _85 * _222;
    float _282 = _85 * _228;
    float _284 = _85 * _234;
    float _286 = -_278;
    float _288 = _260 + _286;
    float _290 = fma(_258, _112, _272);
    float _292 = -_280;
    float _294 = _262 + _292;
    float _296 = -_284;
    float _298 = _282 + _296;
    float _300 = fma(_276, _288, _278);
    float _302 = _85 * _252;
    float _304 = fma(_274, _294, _280);
    float _306 = fma(_290, _298, _284);
    float _308 = _300 * _264;
    float _310 = _304 * _266;
    float _312 = _306 * _302;
    if (!_172)
    {
        out.m_50.x = _308;
        out.m_50.y = _310;
        out.m_50.z = _312;
        out.m_50.w = _152;
        return out;
    }
    bool _314 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _316 = 0.0 + _160;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    bool _320 = !_314;
    float _322 = _318;
    if (!_320)
    {
        float _324 = in.m_52.w;
        float _326 = gl_FragCoord.w;
        float _328 = _324 * _326;
        float _330 = in.m_52.z;
        float _332 = gl_FragCoord.w;
        float _334 = _330 * _332;
        float _336 = _85 * _328;
        float _338 = _85 * _334;
        float _340 = 1.0 / _336;
        float _342 = _338 * _340;
        float _344 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _346 = fma(_342, (*spvDescriptorSet0.fp_c8)._m0[30].w, _344);
        float _348 = 1.0 / _346;
        float _350 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _352 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _354 = fma(_348, _350, _352);
        float _356 = _354 * 8.0;
        float _358 = precise::clamp(_356, 0.0, 1.0);
        float _360 = _318 * _358;
        _322 = _360;
    }
    float _362 = _322;
    float _364 = 0.0 + _362;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    out.m_50.x = _308;
    out.m_50.y = _310;
    out.m_50.z = _312;
    out.m_50.w = _366;
    return out;
}

