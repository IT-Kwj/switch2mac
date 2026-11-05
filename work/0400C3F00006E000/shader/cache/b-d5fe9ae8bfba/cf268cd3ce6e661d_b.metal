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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _235 = float2(_63, _65);
    float4 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_235, float2(0.0), isnan(_235))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_235, float2(0.0), isnan(_235))).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = in.m_35.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_35.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_37.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_37.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _104 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _106 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _102);
    float _108 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _104);
    float _110 = _61 * _82;
    float _112 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _106);
    float _114 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _108);
    float _116 = _61 * _88;
    float _118 = _112 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _120 = _114 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _122 = _110 + _118;
    float _124 = _116 + _120;
    float _126 = _61 * _94;
    float _128 = _61 * _100;
    float2 _339 = float2(_122, _124);
    float4 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_339, float2(0.0), isnan(_339))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_339, float2(0.0), isnan(_339))).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    float2 _355 = float2(_126, _128);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_355, float2(0.0), isnan(_355))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    int _151 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _155 = _151 != 0;
    float _157 = precise::min(_76, _138);
    float _159 = precise::max(_157, _148);
    float _161 = -_148;
    float _163 = _161 + 1.0;
    float _165 = _159;
    if (_155)
    {
        float _167 = precise::min(_157, _148);
        _165 = _167;
    }
    float _169 = _165;
    float _171 = _132 * _163;
    float _173 = _134 * _163;
    float _175 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _136 * _163;
    float _181 = fma(_142, _148, _171);
    float _183 = fma(_144, _148, _173);
    bool _185 = _177 != 0.0;
    bool _187 = isnan(_177);
    bool _189 = _185 || _187;
    bool _191 = isnan(0.0);
    bool _193 = _189 || _191;
    float _195 = fma(_146, _148, _179);
    float _197 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _199 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _201 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    if (_193)
    {
        out.m_40.x = _197;
        out.m_40.y = _199;
        out.m_40.z = _201;
        out.m_40.w = _177;
        return out;
    }
    discard_fragment();
    return out;
}

