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
    float4 m_37 [[user(locn5), flat]];
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
    float2 _371 = float2(_73, _75);
    float2 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_371, float2(0.0), isnan(_371))).xy;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = in.m_37.x;
    float _87 = in.m_35.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_35.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = _85 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _101 = fma(_81, 2.0, -1.0);
    float _103 = _85 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _105 = _71 * _91;
    float _107 = fma(_83, 2.0, -1.0);
    float _109 = _71 * _97;
    float _111 = fma(_99, _101, _105);
    float _113 = fma(_103, _107, _109);
    float2 _434 = float2(_111, _113);
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_434, float2(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_434, float2(0.0), isnan(_434))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float _126 = in.m_39.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_41.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _71 * _130;
    float _140 = in.m_43.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_39.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_43.y;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_39.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_43.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _71 * _144;
    float _172 = _71 * _156;
    float _174 = _71 * _162;
    float _176 = _124 * _138;
    float _178 = _71 * _136;
    float _180 = 0.0 + _176;
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = _182 * _178;
    bool _188 = _184 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _190 = isnan(_184);
    bool _192 = _188 || _190;
    bool _194 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _196 = _192 || _194;
    float _198 = in.m_39.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    if (!_196)
    {
        discard_fragment();
    }
    float _204 = _71 * _202;
    float _206 = _71 * _150;
    float _208 = _71 * _168;
    float _210 = -_170;
    float _212 = _204 + _210;
    float _214 = -_172;
    float _216 = _206 + _214;
    float _218 = -_208;
    float _220 = _174 + _218;
    float _222 = fma(_118, _212, _170);
    float _224 = fma(_120, _216, _172);
    float _226 = fma(_122, _220, _208);
    if (!_196)
    {
        out.m_46.x = _222;
        out.m_46.y = _224;
        out.m_46.z = _226;
        out.m_46.w = _176;
        return out;
    }
    float _228 = _224 * 0.715200006961822509765625;
    float _230 = in.m_48.w;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_48.z;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_48.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = fma(_222, 0.2125999927520751953125, _228);
    float _250 = in.m_48.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = fma(_226, 0.072200000286102294921875, _248);
    bool _258 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _260 = 1.0 / _256;
    float _262 = _260 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _71 * _234;
    float _268 = fma(_264, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _270 = _71 * _240;
    float _272 = _268 * _266;
    float _274 = 0.0 + _184;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _71 * _246;
    float _280 = _71 * _254;
    float _282 = fma(_226, _272, _270);
    float _284 = fma(_222, _272, _278);
    float _286 = fma(_224, _272, _280);
    float _288 = _270;
    if (!_258)
    {
        _288 = _276;
    }
    float _290 = _288;
    bool _292 = !_258;
    float _294 = _290;
    if (!_292)
    {
        float _296 = in.m_50.w;
        float _298 = gl_FragCoord.w;
        float _300 = _296 * _298;
        float _302 = in.m_50.z;
        float _304 = gl_FragCoord.w;
        float _306 = _302 * _304;
        float _308 = _71 * _300;
        float _310 = _71 * _306;
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
        float _332 = _276 * _330;
        _294 = _332;
    }
    float _334 = _294;
    float _336 = 0.0 + _334;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    out.m_46.x = _284;
    out.m_46.y = _286;
    out.m_46.z = _282;
    out.m_46.w = _338;
    return out;
}

