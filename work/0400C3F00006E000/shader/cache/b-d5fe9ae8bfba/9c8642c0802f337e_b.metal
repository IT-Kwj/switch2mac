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
    constant _16* fp_c7 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_50 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_39.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_39.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _334 = float2(_75, _77);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_334, float2(0.0), isnan(_334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_334, float2(0.0), isnan(_334))).xw;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = in.m_41.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_43.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_45.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _73 * _91;
    float _107 = _73 * _97;
    float _109 = _77 * _77;
    float _111 = -_105;
    float _113 = _85 + _111;
    float _115 = _113 * _107;
    float _117 = _73 * _103;
    float _119 = 0.0 + _115;
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = _121 * _117;
    bool _127 = _123 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _129 = isnan(_123);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _135 = _131 || _133;
    float _137 = in.m_39.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_39.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    if (!_135)
    {
        discard_fragment();
    }
    float _149 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 0.0416666679084300994873046875, 0.0199999995529651641845703125);
    float _151 = _73 * _141;
    float _153 = _73 * _147;
    float _155 = _77 * _109;
    float2 _448 = float2(_151, _153);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_448, float2(0.0), isnan(_448))).w;
    float2 _456 = float2(_155, _149);
    float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_456, float2(0.0), isnan(_456))).xyz;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = precise::max(0.0, _157);
    float _171 = precise::min(_169, 0.5);
    float _173 = _171 * 0.20000000298023223876953125;
    float _175 = fma(_83, _83, _173);
    float _177 = fma(_155, _155, _163);
    float _179 = fma(_155, _155, _165);
    float _181 = fma(_155, _155, _167);
    float _183 = _175 + 1.0;
    float _185 = _177 * _183;
    float _187 = _179 * _183;
    float _189 = _181 * _183;
    if (!_135)
    {
        out.m_48.x = _185;
        out.m_48.y = _187;
        out.m_48.z = _189;
        out.m_48.w = _115;
        return out;
    }
    float _191 = _187 * 0.715200006961822509765625;
    float _193 = in.m_50.w;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_50.z;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_50.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = fma(_185, 0.2125999927520751953125, _191);
    float _213 = in.m_50.y;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = fma(_189, 0.072200000286102294921875, _211);
    bool _221 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _223 = 1.0 / _219;
    float _225 = _223 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = _73 * _197;
    float _231 = fma(_227, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _233 = _73 * _203;
    float _235 = _231 * _229;
    float _237 = 0.0 + _123;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _73 * _209;
    float _243 = _73 * _217;
    float _245 = fma(_189, _235, _233);
    float _247 = fma(_185, _235, _241);
    float _249 = fma(_187, _235, _243);
    float _251 = _233;
    if (!_221)
    {
        _251 = _239;
    }
    float _253 = _251;
    bool _255 = !_221;
    float _257 = _253;
    if (!_255)
    {
        float _259 = in.m_52.w;
        float _261 = gl_FragCoord.w;
        float _263 = _259 * _261;
        float _265 = in.m_52.z;
        float _267 = gl_FragCoord.w;
        float _269 = _265 * _267;
        float _271 = _73 * _263;
        float _273 = _73 * _269;
        float _275 = 1.0 / _271;
        float _277 = _273 * _275;
        float _279 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _281 = fma(_277, (*spvDescriptorSet0.fp_c8)._m0[30].w, _279);
        float _283 = 1.0 / _281;
        float _285 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _287 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _289 = fma(_283, _285, _287);
        float _291 = _289 * 8.0;
        float _293 = precise::clamp(_291, 0.0, 1.0);
        float _295 = _239 * _293;
        _257 = _295;
    }
    float _297 = _257;
    float _299 = 0.0 + _297;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    out.m_48.x = _247;
    out.m_48.y = _249;
    out.m_48.z = _245;
    out.m_48.w = _301;
    return out;
}

