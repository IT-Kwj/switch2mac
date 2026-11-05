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
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_44 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_33 [[user(locn5), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.x;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _51;
    float _69 = rint(_53);
    float _71 = precise::max(_69, 0.0);
    uint _74 = uint(_71);
    uint _76 = clamp(_74, 0u, 65535u);
    float _78 = _67 * _59;
    float _80 = _67 * _65;
    float3 _271 = float3(_80, _78, float(int(_76)));
    float3 _275 = select(_271, float3(0.0), isnan(_271));
    float _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _275.xy, uint(rint(_275.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _275.xy, uint(rint(_275.z))).w;
    float _84 = in.m_37.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_39.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_37.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _67 * _88;
    float _104 = _67 * _94;
    float _106 = in.m_37.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_37.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = _67 * _116;
    float _120 = _82 * _102;
    float _122 = 0.0 + _120;
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = _124 * _104;
    bool _130 = _126 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _132 = isnan(_126);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _138 = _134 || _136;
    if (!_138)
    {
        discard_fragment();
    }
    float _140 = _67 * _100;
    float _142 = _67 * _110;
    if (!_138)
    {
        out.m_42.x = _140;
        out.m_42.y = _142;
        out.m_42.z = _118;
        out.m_42.w = _120;
        return out;
    }
    float _144 = _142 * 0.715200006961822509765625;
    float _146 = 0.0 + _126;
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = fma(_140, 0.2125999927520751953125, _144);
    bool _152 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _154 = fma(_118, 0.072200000286102294921875, _150);
    float _156 = 1.0 / _154;
    float _158 = _156 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = fma(_160, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _164 = _140 * _162;
    float _166 = _142 * _162;
    float _168 = _118 * _162;
    float _170 = _162;
    if (!_152)
    {
        _170 = _148;
    }
    float _172 = _170;
    bool _174 = !_152;
    float _176 = _172;
    if (!_174)
    {
        float _178 = in.m_44.w;
        float _180 = gl_FragCoord.w;
        float _182 = _178 * _180;
        float _184 = in.m_44.z;
        float _186 = gl_FragCoord.w;
        float _188 = _184 * _186;
        float _190 = _67 * _182;
        float _192 = _67 * _188;
        float _194 = 1.0 / _190;
        float _196 = _192 * _194;
        float _198 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _200 = fma(_196, (*spvDescriptorSet0.fp_c8)._m0[30].w, _198);
        float _202 = 1.0 / _200;
        float _204 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _206 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _208 = fma(_202, _204, _206);
        float _210 = _208 * 8.0;
        float _212 = precise::clamp(_210, 0.0, 1.0);
        float _214 = _148 * _212;
        _176 = _214;
    }
    float _216 = _176;
    float _218 = 0.0 + _216;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    out.m_42.x = _164;
    out.m_42.y = _166;
    out.m_42.z = _168;
    out.m_42.w = _220;
    return out;
}

