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
    float4 m_46 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _53;
    float _81 = _79 * _59;
    float _83 = _79 * _65;
    float _85 = _79 * _71;
    float _87 = _79 * _77;
    float2 _353 = float2(_81, _87);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_353, float2(0.0), isnan(_353))).w;
    float2 _364 = float2(_83, _85);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float _102 = in.m_37.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_39.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_41.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_39.y;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_39.z;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_37.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _79 * _124;
    float _140 = _100 * _89;
    float _142 = _79 * _106;
    float _144 = _79 * _112;
    float _146 = _140 * _142;
    float _148 = _79 * _118;
    float _150 = _144 * _146;
    float _152 = 0.0 + _150;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _154 * _148;
    bool _160 = _156 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _162 = isnan(_156);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _168 = _164 || _166;
    float _170 = in.m_39.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_37.y;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_37.z;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    if (!_168)
    {
        discard_fragment();
    }
    float _188 = _79 * _136;
    float _190 = _94 * _94;
    float _192 = _96 * _96;
    float _194 = _79 * _174;
    float _196 = _79 * _180;
    float _198 = _79 * _186;
    float _200 = _79 * _130;
    float _202 = -_194;
    float _204 = _188 + _202;
    float _206 = -_138;
    float _208 = _196 + _206;
    float _210 = _98 * _98;
    float _212 = -_200;
    float _214 = _198 + _212;
    float _216 = fma(_190, _204, _194);
    float _218 = fma(_192, _208, _138);
    float _220 = fma(_210, _214, _200);
    if (!_168)
    {
        out.m_44.x = _216;
        out.m_44.y = _218;
        out.m_44.z = _220;
        out.m_44.w = _150;
        return out;
    }
    float _222 = _218 * 0.715200006961822509765625;
    float _224 = 0.0 + _156;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = fma(_216, 0.2125999927520751953125, _222);
    bool _230 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _232 = fma(_220, 0.072200000286102294921875, _228);
    float _234 = 1.0 / _232;
    float _236 = _234 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = fma(_238, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _242 = _216 * _240;
    float _244 = _218 * _240;
    float _246 = _220 * _240;
    float _248 = _240;
    if (!_230)
    {
        _248 = _226;
    }
    float _250 = _248;
    bool _252 = !_230;
    float _254 = _250;
    if (!_252)
    {
        float _256 = in.m_46.w;
        float _258 = gl_FragCoord.w;
        float _260 = _256 * _258;
        float _262 = in.m_46.z;
        float _264 = gl_FragCoord.w;
        float _266 = _262 * _264;
        float _268 = _79 * _260;
        float _270 = _79 * _266;
        float _272 = 1.0 / _268;
        float _274 = _270 * _272;
        float _276 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _278 = fma(_274, (*spvDescriptorSet0.fp_c8)._m0[30].w, _276);
        float _280 = 1.0 / _278;
        float _282 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _284 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _286 = fma(_280, _282, _284);
        float _288 = _286 * 8.0;
        float _290 = precise::clamp(_288, 0.0, 1.0);
        float _292 = _226 * _290;
        _254 = _292;
    }
    float _294 = _254;
    float _296 = 0.0 + _294;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    out.m_44.x = _242;
    out.m_44.y = _244;
    out.m_44.z = _246;
    out.m_44.w = _298;
    return out;
}

