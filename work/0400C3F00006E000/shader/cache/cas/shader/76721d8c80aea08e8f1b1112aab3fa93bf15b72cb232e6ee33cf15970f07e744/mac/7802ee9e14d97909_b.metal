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
    constant _16* fp_c13 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_37 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _51;
    float _79 = _77 * _57;
    float _81 = _77 * _63;
    float _83 = _77 * _69;
    float _85 = _77 * _75;
    float2 _305 = float2(_85, _79);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_305, float2(0.0), isnan(_305))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_305, float2(0.0), isnan(_305))).w;
    float2 _317 = float2(_81, _83);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_317, float2(0.0), isnan(_317))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_317, float2(0.0), isnan(_317))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float _100 = in.m_35.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_35.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_37.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_35.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_35.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_39.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_39.z;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_39.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_39.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_37.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_41.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_37.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _174 = _172 + 1.0;
    float _176 = _77 * _104;
    float _178 = _77 * _110;
    float _180 = _77 * _116;
    float _182 = _77 * _122;
    float _184 = _77 * _128;
    float _186 = _77 * _134;
    float _188 = _77 * _140;
    float _190 = _77 * _146;
    float _192 = _77 * _152;
    float _194 = -_186;
    float _196 = _184 + _194;
    float _198 = _77 * _158;
    float _200 = -_188;
    float _202 = _178 + _200;
    float _204 = _77 * _164;
    float _206 = _77 * _170;
    float _208 = -_190;
    float _210 = _176 + _208;
    float _212 = fma(_198, (*spvDescriptorSet0.fp_c13)._m0[0].y, _174);
    float _214 = fma(_206, (*spvDescriptorSet0.fp_c13)._m0[0].y, _174);
    float _216 = _87 * _98;
    float _218 = fma(_180, (*spvDescriptorSet0.fp_c13)._m0[0].y, _174);
    float _220 = _94 * _94;
    float _222 = _216 * _182;
    float _224 = _92 * _92;
    float _226 = _96 * _96;
    float _228 = _192 * _222;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = fma(_224, _196, _186);
    float _234 = fma(_226, _202, _188);
    float _236 = fma(_220, _210, _190);
    float _238 = _230 * _204;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _232 * _212;
    float _244 = _234 * _214;
    float _246 = _236 * _218;
    float _248 = _240 * (*spvDescriptorSet0.fp_c15)._m0[0].w;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    out.m_44.x = _242;
    out.m_44.y = _246;
    out.m_44.z = _244;
    out.m_44.w = _250;
    return out;
}

