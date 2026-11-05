#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d_array<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = float(as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].w));
    float _59 = rint(_57);
    float _61 = precise::max(_59, 0.0);
    uint _64 = uint(_61);
    uint _66 = clamp(_64, 0u, 65535u);
    float _68 = 1.0 / _43;
    float _70 = _68 * _49;
    float _72 = _68 * _55;
    float3 _282 = float3(_72, _70, float(int(_66)));
    float3 _286 = select(_282, float3(0.0), isnan(_282));
    float2 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _286.xy, uint(rint(_286.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _286.xy, uint(rint(_286.z))).xw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = in.m_33.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_33.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = (*spvDescriptorSet0.fp_c3)._m0[0].w * 6.283185482025146484375;
    float _96 = _68 * _86;
    float _98 = _68 * _92;
    float _100 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[2].w));
    float _102 = _94 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _104 = fma(_96, 2.0, -1.0);
    float _106 = fma(_98, 2.0, -1.0);
    float _108 = _104 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _110 = _106 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _112 = _108 * _108;
    float _114 = fma(_110, _110, _112);
    float _116 = sqrt(_114);
    float _118 = spvFAdd(_116, 9.9999997473787516355514526367188e-06);
    float _120 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[0].z, _118);
    float _122 = 1.0 / _118;
    float _124 = _120 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _128 = _124 > (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _130 = _102 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _132 = _104 * _104;
    float _134 = -_130;
    float _136 = fma(_118, _94, _134);
    float _138 = fma(_106, _106, _132);
    float _140 = (*spvDescriptorSet0.fp_c3)._m0[2].z + (-20.0);
    float _142 = _136 + (-1.57079637050628662109375);
    float _144 = precise::min(_138, 1.0);
    float _146 = _104;
    if (_128)
    {
        float _148 = _118 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _146 = _148;
    }
    float _150 = _146;
    float _152 = _142 * 0.15915493667125701904296875;
    float _154 = -_144;
    float _156 = _154 + 1.0;
    bool _158 = _150 < (*spvDescriptorSet0.fp_c3)._m0[2].y;
    bool _160 = _158 && _128;
    float _162 = -_140;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _166 = _152 * 6.283185482025146484375;
    float _168 = cos(_166);
    bool _170 = !_160;
    float _172 = _170 ? 0.0 : 1.0;
    float _174 = _164 * 0.0500000007450580596923828125;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _172 * _156;
    float _180 = -_176;
    float _182 = _180 + 1.0;
    float _184 = _152 * 6.283185482025146484375;
    float _186 = sin(_184);
    float _188 = _178 * _182;
    float _190 = _168 * _122;
    float _192 = _78 * 100.0;
    float _194 = -_80;
    float _196 = _194 + 1.0;
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _200 = _198 * 2.0;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = _188 * _196;
    float _206 = fma(_202, 0.89999997615814208984375, 0.10000002384185791015625);
    float _208 = _204 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _210 = _190 * 0.300000011920928955078125;
    float _212 = fma(_186, 0.5, 0.5);
    float _214 = _206 * _208;
    float _216 = _208 * _210;
    float _218 = _204 * _212;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = _212 * _214;
    float _224 = _110 * _216;
    float _226 = -_108;
    float _228 = fma(_226, _216, -0.0);
    out.m_36.x = _224;
    out.m_36.y = _222;
    out.m_36.z = _228;
    out.m_36.w = _220;
    return out;
}

