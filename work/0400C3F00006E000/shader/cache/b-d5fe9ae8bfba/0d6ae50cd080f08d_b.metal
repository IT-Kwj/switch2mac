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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _49;
    float _107 = _105 * _55;
    float _109 = _105 * _61;
    float _111 = _105 * _67;
    float _113 = _105 * _73;
    float _115 = _105 * _79;
    float _117 = _105 * _103;
    float _119 = 1.0 / _107;
    float _121 = 1.0 / _109;
    float _123 = 1.0 / _111;
    float _125 = _113 * _119;
    float _127 = _115 * _119;
    float _129 = _105 * _85;
    float _131 = _105 * _91;
    float _133 = _105 * _97;
    float _135 = _129 * _121;
    float _137 = _131 * _121;
    float2 _403 = float2(_125, _127);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_403, float2(0.0), isnan(_403))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_403, float2(0.0), isnan(_403))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _422 = float2(_135, _137);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_422, float2(0.0), isnan(_422))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float _160 = _133 * _123;
    float _162 = _117 * _123;
    float2 _444 = float2(_160, _162);
    float4 _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_444, float2(0.0), isnan(_444))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_444, float2(0.0), isnan(_444))).xyzw;
    float _166 = _164.x;
    float _168 = _164.y;
    float _170 = _164.z;
    float _172 = _164.w;
    float _174 = in.m_39.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_39.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_39.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_39.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    int _199 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _203 = _199 != 0;
    int _205 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _207 = _205 != 0;
    float _209 = precise::max(_148, _158);
    float _211 = _209;
    if (_203)
    {
        float _213 = precise::min(_148, _158);
        _211 = _213;
    }
    float _215 = _211;
    float _217 = -_158;
    float _219 = _217 + 1.0;
    float _221 = _142 * _219;
    float _223 = precise::max(_215, _172);
    float _225 = _144 * _219;
    float _227 = _223;
    if (_207)
    {
        float _229 = precise::min(_215, _172);
        _227 = _229;
    }
    float _231 = _227;
    float _233 = _146 * _219;
    float _235 = fma(_152, _158, _221);
    float _237 = fma(_154, _158, _225);
    float _239 = fma(_156, _158, _233);
    float _241 = _105 * _178;
    float _243 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _245 = _239 * _170;
    float _247 = _243 * _241;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _235 * _166;
    float _253 = _237 * _168;
    float _255 = _105 * _184;
    bool _257 = _249 != 0.0;
    bool _259 = isnan(_249);
    bool _261 = _257 || _259;
    bool _263 = isnan(0.0);
    bool _265 = _261 || _263;
    float _267 = _105 * _190;
    float _269 = _105 * _196;
    float _271 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _273 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _275 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _277 = _271 * _255;
    float _279 = _273 * _267;
    float _281 = _275 * _269;
    if (_265)
    {
        out.m_42.x = _277;
        out.m_42.y = _279;
        out.m_42.z = _281;
        out.m_42.w = _249;
        return out;
    }
    discard_fragment();
    return out;
}

