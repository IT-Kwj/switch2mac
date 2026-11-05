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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
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
    float _49 = in.m_33.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_33.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_33.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_37.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = 1.0 / _47;
    float _105 = _103 * _53;
    float _107 = _103 * _59;
    float _109 = _103 * _65;
    float _111 = _103 * _71;
    float _113 = _103 * _77;
    float _115 = 1.0 / _107;
    float _117 = _103 * _83;
    float _119 = _103 * _89;
    float _121 = _103 * _95;
    float _123 = _103 * _101;
    float _125 = 1.0 / _105;
    float _127 = 1.0 / _109;
    float _129 = _111 * _115;
    float _131 = _113 * _115;
    float _133 = _117 * _125;
    float _135 = _119 * _125;
    float2 _361 = float2(_129, _131);
    float4 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361))).xyzw;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = _138.w;
    float _148 = _121 * _127;
    float _150 = _123 * _127;
    float2 _386 = float2(_133, _135);
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_386, float2(0.0), isnan(_386))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_386, float2(0.0), isnan(_386))).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float2 _402 = float2(_148, _150);
    float4 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_402, float2(0.0), isnan(_402))).xyzw;
    float _164 = _162.x;
    float _166 = _162.y;
    float _168 = _162.z;
    float _170 = _162.w;
    int _173 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _177 = _173 != 0;
    int _179 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _181 = _179 != 0;
    float _183 = precise::max(_146, _160);
    float _185 = -_160;
    float _187 = _185 + 1.0;
    float _189 = _183;
    if (_177)
    {
        float _191 = precise::min(_146, _160);
        _189 = _191;
    }
    float _193 = _189;
    float _195 = _140 * _187;
    float _197 = precise::max(_193, _170);
    float _199 = _142 * _187;
    float _201 = _197;
    if (_181)
    {
        float _203 = precise::min(_193, _170);
        _201 = _203;
    }
    float _205 = _201;
    float _207 = _144 * _187;
    float _209 = fma(_154, _160, _195);
    float _211 = fma(_156, _160, _199);
    float _213 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = fma(_158, _160, _207);
    float _219 = _209 * _164;
    float _221 = _211 * _166;
    float _223 = _217 * _168;
    bool _225 = _215 != 0.0;
    bool _227 = isnan(_215);
    bool _229 = _225 || _227;
    bool _231 = isnan(0.0);
    bool _233 = _229 || _231;
    float _235 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _237 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _239 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    if (_233)
    {
        out.m_40.x = _235;
        out.m_40.y = _239;
        out.m_40.z = _237;
        out.m_40.w = _215;
        return out;
    }
    discard_fragment();
    return out;
}

