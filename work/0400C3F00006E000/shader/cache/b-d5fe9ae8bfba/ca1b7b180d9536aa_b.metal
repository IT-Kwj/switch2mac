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
    float2 _277 = float2(_65, _67);
    float4 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_277, float2(0.0), isnan(_277))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = in.m_35.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_35.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_37.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_37.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _63 * _96;
    float _106 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _108 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _110 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _106);
    float _112 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _108);
    float _114 = _63 * _90;
    float _116 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, _110);
    float _118 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].z, _112);
    float _120 = _63 * _84;
    float _122 = _116 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _124 = _118 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _126 = _120 + _122;
    float _128 = _114 + _124;
    float _130 = _63 * _102;
    float2 _381 = float2(_126, _128);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_381, float2(0.0), isnan(_381))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_381, float2(0.0), isnan(_381))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float2 _397 = float2(_130, _104);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).xyzw;
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
    float _183 = precise::min(_78, _140);
    float _185 = precise::max(_183, _150);
    float _187 = -_183;
    float _189 = _187 + 1.0;
    float _191 = _185;
    if (_181)
    {
        float _193 = precise::min(_183, _150);
        _191 = _193;
    }
    float _195 = _191;
    float _197 = _144 * _189;
    float _199 = _146 * _189;
    float _201 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _203 = _63 * _156;
    float _205 = _148 * _189;
    float _207 = fma(_134, _183, _197);
    float _209 = _201 * _203;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = fma(_138, _183, _205);
    float _215 = fma(_136, _183, _199);
    float _217 = _63 * _162;
    bool _219 = _211 != 0.0;
    bool _221 = isnan(_211);
    bool _223 = _219 || _221;
    bool _225 = isnan(0.0);
    bool _227 = _223 || _225;
    float _229 = _63 * _168;
    float _231 = _63 * _174;
    float _233 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _235 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _237 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _239 = _233 * _217;
    float _241 = _235 * _229;
    float _243 = _237 * _231;
    if (_227)
    {
        out.m_42.x = _239;
        out.m_42.y = _241;
        out.m_42.z = _243;
        out.m_42.w = _211;
        return out;
    }
    discard_fragment();
    return out;
}

