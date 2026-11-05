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
    float4 m_48 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
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
    float _118 = in.m_39.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_41.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _81 * _116;
    float _132 = in.m_43.z;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_39.y;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_37.x;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_37.y;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_37.z;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _81 * _142;
    float _164 = _100 * _110;
    float _166 = _81 * _122;
    float _168 = _164 * _130;
    float _170 = _81 * _128;
    float _172 = _166 * _168;
    float _174 = 0.0 + _172;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _176 * _170;
    bool _182 = _178 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _184 = isnan(_178);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _190 = _186 || _188;
    float _192 = in.m_43.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_39.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_39.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_43.y;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    if (!_190)
    {
        discard_fragment();
    }
    float _216 = _96 * _106;
    float _218 = _94 * _104;
    float _220 = _98 * _108;
    float _222 = _81 * _196;
    float _224 = _81 * _202;
    float _226 = _81 * _136;
    float _228 = _81 * _208;
    float _230 = _81 * _214;
    float _232 = -_226;
    float _234 = _224 + _232;
    float _236 = -_222;
    float _238 = _228 + _236;
    float _240 = -_230;
    float _242 = _162 + _240;
    float _244 = fma(_220, _234, _226);
    float _246 = fma(_218, _238, _222);
    float _248 = _81 * _148;
    float _250 = fma(_216, _242, _230);
    float _252 = _81 * _154;
    float _254 = _81 * _160;
    float _256 = _246 * _248;
    float _258 = _250 * _252;
    float _260 = _244 * _254;
    if (!_190)
    {
        out.m_46.x = _256;
        out.m_46.y = _258;
        out.m_46.z = _260;
        out.m_46.w = _172;
        return out;
    }
    float _262 = _258 * 0.715200006961822509765625;
    float _264 = 0.0 + _178;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = fma(_256, 0.2125999927520751953125, _262);
    bool _270 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _272 = fma(_260, 0.072200000286102294921875, _268);
    float _274 = 1.0 / _272;
    float _276 = _274 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = fma(_278, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _282 = _256 * _280;
    float _284 = _258 * _280;
    float _286 = _260 * _280;
    float _288 = _280;
    if (!_270)
    {
        _288 = _266;
    }
    float _290 = _288;
    bool _292 = !_270;
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
        float _332 = _266 * _330;
        _294 = _332;
    }
    float _334 = _294;
    float _336 = 0.0 + _334;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    out.m_46.x = _282;
    out.m_46.y = _284;
    out.m_46.z = _286;
    out.m_46.w = _338;
    return out;
}

