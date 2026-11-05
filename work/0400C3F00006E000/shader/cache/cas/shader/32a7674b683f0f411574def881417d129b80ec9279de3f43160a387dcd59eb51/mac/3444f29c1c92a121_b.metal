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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _267 = float2(_65, _67);
    float4 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_267, float2(0.0), isnan(_267))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = in.m_35.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_35.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_37.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_37.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _106 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _108 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _104);
    float _110 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _106);
    float _112 = _63 * _84;
    float _114 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, _108);
    float _116 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].z, _110);
    float _118 = _63 * _90;
    float _120 = _114 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _122 = _116 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _124 = _118 + _120;
    float _126 = _112 + _122;
    float _128 = _63 * _96;
    float _130 = _63 * _102;
    float2 _371 = float2(_124, _126);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_371, float2(0.0), isnan(_371))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float2 _387 = float2(_130, _128);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_387, float2(0.0), isnan(_387))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float _152 = in.m_39.w;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_39.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_39.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_39.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    int _177 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _181 = _177 != 0;
    float _183 = _63 * _156;
    float _185 = _63 * _162;
    float _187 = precise::min(_78, _140);
    float _189 = _134 * _144;
    float _191 = _138 * _148;
    float _193 = precise::max(_187, _150);
    float _195 = _193;
    if (_181)
    {
        float _197 = precise::min(_187, _150);
        _195 = _197;
    }
    float _199 = _195;
    float _201 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _203 = _136 * _146;
    float _205 = _63 * _168;
    float _207 = _201 * _183;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = _63 * _174;
    float _213 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _215 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    bool _217 = _209 != 0.0;
    bool _219 = isnan(_209);
    bool _221 = _217 || _219;
    bool _223 = isnan(0.0);
    bool _225 = _221 || _223;
    float _227 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _229 = _213 * _185;
    float _231 = _215 * _205;
    float _233 = _227 * _211;
    if (_225)
    {
        out.m_42.x = _229;
        out.m_42.y = _231;
        out.m_42.z = _233;
        out.m_42.w = _209;
        return out;
    }
    discard_fragment();
    return out;
}

