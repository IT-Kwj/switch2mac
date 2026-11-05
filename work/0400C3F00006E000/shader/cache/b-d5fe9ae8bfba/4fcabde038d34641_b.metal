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
    float2 _393 = float2(_83, _85);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float2 _412 = float2(_87, _89);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_412, float2(0.0), isnan(_412))).xyzw;
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
    float _124 = in.m_41.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _81 * _116;
    float _132 = _81 * _122;
    float _134 = in.m_37.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_37.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_41.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_41.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = _81 * _138;
    float _160 = _100 * _110;
    float _162 = _160 * _130;
    float _164 = 0.0 + _162;
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = _166 * _132;
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
    float _188 = _94 * _94;
    float _190 = _96 * _96;
    float _192 = _81 * _150;
    float _194 = _188 * _104;
    float _196 = _190 * _106;
    float _198 = _98 * _98;
    float _200 = _81 * _128;
    float _202 = _81 * _144;
    float _204 = _81 * _156;
    float _206 = _198 * _108;
    float _208 = -_192;
    float _210 = _158 + _208;
    float _212 = _81 * _186;
    float _214 = -_200;
    float _216 = _212 + _214;
    float _218 = -_204;
    float _220 = _202 + _218;
    float _222 = fma(_194, _210, _192);
    float _224 = fma(_196, _216, _200);
    float _226 = fma(_206, _220, _204);
    if (!_180)
    {
        out.m_44.x = _222;
        out.m_44.y = _224;
        out.m_44.z = _226;
        out.m_44.w = _162;
        return out;
    }
    float _228 = _224 * 0.715200006961822509765625;
    float _230 = in.m_46.w;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_46.z;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_46.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = fma(_222, 0.2125999927520751953125, _228);
    float _250 = in.m_46.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = fma(_226, 0.072200000286102294921875, _248);
    bool _258 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _260 = 1.0 / _256;
    float _262 = _260 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = fma(_264, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _268 = _81 * _234;
    float _270 = 0.0 + _168;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _81 * _240;
    float _276 = _81 * _254;
    float _278 = _266 * _268;
    float _280 = _81 * _246;
    float _282 = fma(_226, _278, _274);
    float _284 = fma(_222, _278, _280);
    float _286 = fma(_224, _278, _276);
    float _288 = _274;
    if (!_258)
    {
        _288 = _272;
    }
    float _290 = _288;
    bool _292 = !_258;
    float _294 = _290;
    if (!_292)
    {
        float _296 = in.m_48.w;
        float _298 = gl_FragCoord.w;
        float _300 = _296 * _298;
        float _302 = in.m_48.z;
        float _304 = gl_FragCoord.w;
        float _306 = _302 * _304;
        float _308 = _81 * _300;
        float _310 = _81 * _306;
        float _312 = 1.0 / _308;
        float _314 = _310 * _312;
        float _316 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _318 = fma(_314, (*spvDescriptorSet0.fp_c8)._m0[30].w, _316);
        float _320 = 1.0 / _318;
        float _322 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _324 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _326 = fma(_320, _322, _324);
        float _328 = _326 * 8.0;
        float _330 = precise::clamp(_328, 0.0, 1.0);
        float _332 = _272 * _330;
        _294 = _332;
    }
    float _334 = _294;
    float _336 = 0.0 + _334;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    out.m_44.x = _284;
    out.m_44.y = _286;
    out.m_44.z = _282;
    out.m_44.w = _338;
    return out;
}

