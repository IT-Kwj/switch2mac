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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _55;
    float _83 = _81 * _61;
    float _85 = _81 * _67;
    float _87 = _81 * _73;
    float _89 = _81 * _79;
    float2 _407 = float2(_83, _85);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_407, float2(0.0), isnan(_407))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float2 _426 = float2(_87, _89);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_426, float2(0.0), isnan(_426))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float _112 = in.m_37.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_39.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_41.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _81 * _116;
    float _132 = _81 * _128;
    float _134 = in.m_37.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_39.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_39.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_39.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = _81 * _138;
    float _160 = -_100;
    float _162 = _160 + 1.0;
    float _164 = _81 * _122;
    float _166 = -_130;
    float _168 = fma(_110, _162, _166);
    float _170 = _168 * 4.0;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = _164 * _172;
    float _176 = 0.0 + _174;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _178 * _132;
    bool _184 = _180 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _186 = isnan(_180);
    bool _188 = _184 || _186;
    bool _190 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _192 = _188 || _190;
    float _194 = in.m_37.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_37.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    if (!_192)
    {
        discard_fragment();
    }
    float _206 = -_94;
    float _208 = _206 + 1.0;
    float _210 = -_96;
    float _212 = _210 + 1.0;
    float _214 = _104 * _104;
    float _216 = _106 * _106;
    float _218 = _108 * _108;
    float _220 = _81 * _144;
    float _222 = _214 * _208;
    float _224 = _216 * _212;
    float _226 = -_98;
    float _228 = _226 + 1.0;
    float _230 = _81 * _150;
    float _232 = _218 * _228;
    float _234 = -_230;
    float _236 = _158 + _234;
    float _238 = _81 * _198;
    float _240 = _81 * _204;
    float _242 = _81 * _156;
    float _244 = fma(_224, _236, _230);
    float _246 = -_220;
    float _248 = _240 + _246;
    float _250 = -_242;
    float _252 = _238 + _250;
    float _254 = fma(_222, _248, _220);
    float _256 = fma(_232, _252, _242);
    if (!_192)
    {
        out.m_44.x = _254;
        out.m_44.y = _244;
        out.m_44.z = _256;
        out.m_44.w = _174;
        return out;
    }
    float _258 = in.m_46.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_46.w;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_46.y;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_46.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    bool _282 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _284 = 0.0 + _180;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = _81 * _262;
    float _290 = _81 * _268;
    float _292 = _81 * _274;
    float _294 = _81 * _280;
    float _296 = fma(_254, _290, _288);
    float _298 = fma(_244, _290, _292);
    float _300 = fma(_256, _290, _294);
    float _302 = _288;
    if (!_282)
    {
        _302 = _286;
    }
    float _304 = _302;
    bool _306 = !_282;
    float _308 = _304;
    if (!_306)
    {
        float _310 = in.m_48.w;
        float _312 = gl_FragCoord.w;
        float _314 = _310 * _312;
        float _316 = in.m_48.z;
        float _318 = gl_FragCoord.w;
        float _320 = _316 * _318;
        float _322 = _81 * _314;
        float _324 = _81 * _320;
        float _326 = 1.0 / _322;
        float _328 = _324 * _326;
        float _330 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _332 = fma(_328, (*spvDescriptorSet0.fp_c8)._m0[30].w, _330);
        float _334 = 1.0 / _332;
        float _336 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _338 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _340 = fma(_334, _336, _338);
        float _342 = _340 * 8.0;
        float _344 = precise::clamp(_342, 0.0, 1.0);
        float _346 = _286 * _344;
        _308 = _346;
    }
    float _348 = _308;
    float _350 = 0.0 + _348;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    out.m_44.x = _296;
    out.m_44.y = _298;
    out.m_44.z = _300;
    out.m_44.w = _352;
    return out;
}

