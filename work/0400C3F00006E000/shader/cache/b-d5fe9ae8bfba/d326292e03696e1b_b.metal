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
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _55;
    float _83 = _81 * _61;
    float _85 = _81 * _67;
    float _87 = _81 * _73;
    float _89 = _81 * _79;
    float2 _387 = float2(_83, _85);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_387, float2(0.0), isnan(_387))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float2 _406 = float2(_87, _89);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_406, float2(0.0), isnan(_406))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float _112 = in.m_37.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_39.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = _81 * _116;
    float _126 = _81 * _122;
    float _128 = in.m_37.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_37.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_41.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_41.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_41.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = _81 * _132;
    float _160 = _100 * _110;
    float _162 = _160 * _124;
    float _164 = 0.0 + _162;
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = _166 * _126;
    bool _172 = _168 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _174 = isnan(_168);
    bool _176 = _172 || _174;
    bool _178 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _180 = _176 || _178;
    float _182 = in.m_37.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    if (!_180)
    {
        discard_fragment();
    }
    float _188 = _96 * _106;
    float _190 = _94 * _104;
    float _192 = _81 * _138;
    float _194 = _81 * _144;
    float _196 = _81 * _150;
    float _198 = _81 * _156;
    float _200 = _98 * _108;
    float _202 = -_194;
    float _204 = _158 + _202;
    float _206 = -_198;
    float _208 = _192 + _206;
    float _210 = fma(_190, _204, _194);
    float _212 = fma(_200, _208, _198);
    float _214 = _81 * _186;
    float _216 = -_196;
    float _218 = _214 + _216;
    float _220 = fma(_188, _218, _196);
    if (!_180)
    {
        out.m_44.x = _210;
        out.m_44.y = _220;
        out.m_44.z = _212;
        out.m_44.w = _162;
        return out;
    }
    float _222 = _220 * 0.715200006961822509765625;
    float _224 = in.m_46.w;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_46.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_46.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = fma(_210, 0.2125999927520751953125, _222);
    float _244 = in.m_46.y;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = fma(_212, 0.072200000286102294921875, _242);
    bool _252 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _254 = 1.0 / _250;
    float _256 = _254 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = fma(_258, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _262 = _81 * _228;
    float _264 = 0.0 + _168;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _81 * _234;
    float _270 = _81 * _248;
    float _272 = _260 * _262;
    float _274 = _81 * _240;
    float _276 = fma(_212, _272, _268);
    float _278 = fma(_210, _272, _274);
    float _280 = fma(_220, _272, _270);
    float _282 = _268;
    if (!_252)
    {
        _282 = _266;
    }
    float _284 = _282;
    bool _286 = !_252;
    float _288 = _284;
    if (!_286)
    {
        float _290 = in.m_48.w;
        float _292 = gl_FragCoord.w;
        float _294 = _290 * _292;
        float _296 = in.m_48.z;
        float _298 = gl_FragCoord.w;
        float _300 = _296 * _298;
        float _302 = _81 * _294;
        float _304 = _81 * _300;
        float _306 = 1.0 / _302;
        float _308 = _304 * _306;
        float _310 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _312 = fma(_308, (*spvDescriptorSet0.fp_c8)._m0[30].w, _310);
        float _314 = 1.0 / _312;
        float _316 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _318 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _320 = fma(_314, _316, _318);
        float _322 = _320 * 8.0;
        float _324 = precise::clamp(_322, 0.0, 1.0);
        float _326 = _266 * _324;
        _288 = _326;
    }
    float _328 = _288;
    float _330 = 0.0 + _328;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    out.m_44.x = _278;
    out.m_44.y = _280;
    out.m_44.z = _276;
    out.m_44.w = _332;
    return out;
}

