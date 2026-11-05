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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
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
    float2 _273 = float2(_65, _67);
    float4 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_273, float2(0.0), isnan(_273))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_273, float2(0.0), isnan(_273))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = in.m_35.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_37.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_35.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_37.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _106 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _108 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _104);
    float _110 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _106);
    float _112 = _63 * _90;
    float _114 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, _108);
    float _116 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].z, _110);
    float _118 = _63 * _84;
    float _120 = _63 * _102;
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _124 = _116 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _126 = _63 * _96;
    float _128 = _118 + _122;
    float _130 = _112 + _124;
    float _132 = _126 + _124;
    float _134 = _120 + _122;
    float2 _383 = float2(_134, _130);
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_383, float2(0.0), isnan(_383))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_383, float2(0.0), isnan(_383))).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float2 _399 = float2(_128, _132);
    float4 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_399, float2(0.0), isnan(_399))).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    float _156 = in.m_39.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_39.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_39.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_39.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    int _181 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _185 = _181 != 0;
    float _187 = precise::min(_78, _144);
    float _189 = precise::min(_78, _154);
    float _191 = _138 * _148;
    float _193 = _142 * _152;
    float _195 = _63 * _172;
    float _197 = precise::max(_187, _189);
    float _199 = _197;
    if (_185)
    {
        float _201 = precise::min(_187, _189);
        _199 = _201;
    }
    float _203 = _199;
    float _205 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _207 = _63 * _160;
    float _209 = _140 * _150;
    float _211 = _63 * _166;
    float _213 = _205 * _207;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _63 * _178;
    float _219 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _221 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _223 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _225 = _215 != 0.0;
    bool _227 = isnan(_215);
    bool _229 = _225 || _227;
    bool _231 = isnan(0.0);
    bool _233 = _229 || _231;
    float _235 = _219 * _195;
    float _237 = _221 * _211;
    float _239 = _223 * _217;
    if (_233)
    {
        out.m_42.x = _237;
        out.m_42.y = _235;
        out.m_42.z = _239;
        out.m_42.w = _215;
        return out;
    }
    discard_fragment();
    return out;
}

