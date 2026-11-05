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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_56 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_41.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_41.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_41.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_43.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_43.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = 1.0 / _63;
    float _97 = _95 * _69;
    float _99 = _95 * _75;
    float _101 = _95 * _81;
    float _103 = _95 * _87;
    float _105 = 1.0 / _97;
    float _107 = _95 * _93;
    float _109 = _99 * _105;
    float _111 = _101 * _105;
    float2 _460 = float2(_109, _111);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_460, float2(0.0), isnan(_460))).x;
    float2 _471 = float2(_103, _107);
    float2 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_471, float2(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_471, float2(0.0), isnan(_471))).xw;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = in.m_41.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_45.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_47.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_49.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _95 * _127;
    float _149 = _147 * _105;
    float _151 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _153 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _155 = fma(_149, (*spvDescriptorSet0.fp_c8)._m0[30].w, _153);
    float _157 = _95 * _133;
    float _159 = 1.0 / _155;
    float _161 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _163 = fma(_113, (*spvDescriptorSet0.fp_c8)._m0[30].w, _161);
    float _165 = 1.0 / _163;
    float _167 = -_157;
    float _169 = _121 + _167;
    float _171 = _95 * _139;
    float _173 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _175 = _159 * _173;
    float _177 = _169 * _171;
    float _179 = 0.0 + _177;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _185 = -_175;
    float _187 = fma(_165, _183, _185);
    float _189 = _187 * _151;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _95 * _145;
    float _195 = _181 * _191;
    float _197 = _195 * _193;
    bool _201 = _197 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _203 = isnan(_197);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _209 = _205 || _207;
    float _211 = in.m_51.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = _175;
    float _219 = _197;
    if (!_209)
    {
        discard_fragment();
    }
    float _221 = in.m_51.x;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_43.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _95 * _215;
    float _235 = in.m_43.w;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = _233 * _233;
    float _243 = _95 * _225;
    float _245 = _95 * _231;
    float _247 = fma(_243, _243, _241);
    float _249 = sqrt(_247);
    float _251 = _95 * _239;
    float _253 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 0.0416666679084300994873046875, 0.0199999995529651641845703125);
    float2 _668 = float2(_245, _251);
    float _255 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_668, float2(0.0), isnan(_668))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_668, float2(0.0), isnan(_668))).x;
    float _257 = precise::max(0.0, _249);
    float _259 = precise::min(_257, 0.5);
    float _261 = fma(_259, -2.0, 1.0);
    float _263 = _261 * _261;
    float _265 = _261 * _263;
    float2 _690 = float2(_265, _253);
    float3 _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_690, float2(0.0), isnan(_690))).xyz;
    float _271 = _269.x;
    float _273 = _269.y;
    float _275 = _269.z;
    float _277 = _119 * _119;
    float _279 = precise::max(_277, 0.3499999940395355224609375);
    float _281 = precise::min(_279, 0.5);
    float _283 = fma(_281, 6.666666507720947265625, -2.3333332538604736328125);
    float _285 = _255 * _255;
    float _287 = precise::max(0.0, _285);
    float _289 = precise::min(_287, 0.5);
    float _291 = fma(_289, 2.0, _277);
    float _293 = _283 + _291;
    float _295 = _293 + 1.0;
    float _297 = fma(_265, _265, _271);
    float _299 = fma(_265, _265, _273);
    float _301 = fma(_265, _265, _275);
    float _303 = _297 * _295;
    float _305 = _299 * _295;
    float _307 = _301 * _295;
    if (!_209)
    {
        out.m_54.x = _303;
        out.m_54.y = _305;
        out.m_54.z = _307;
        out.m_54.w = _177;
        return out;
    }
    float _309 = _305 * 0.715200006961822509765625;
    float _311 = in.m_56.w;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_56.x;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_56.y;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = fma(_303, 0.2125999927520751953125, _309);
    float _331 = in.m_56.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = fma(_307, 0.072200000286102294921875, _329);
    bool _339 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _341 = 1.0 / _337;
    if (_339)
    {
        float _343 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _345 = _175 + _343;
        _217 = _345;
    }
    float _347 = _217;
    float _349 = _341 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = fma(_351, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _355 = _95 * _315;
    float _357 = _95 * _327;
    float _359 = _353 * _355;
    float _361 = 0.0 + _197;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = _363;
    if (_339)
    {
        float _367 = _347 * 8.0;
        float _369 = precise::clamp(_367, 0.0, 1.0);
        _219 = _369;
    }
    float _371 = _219;
    float _373 = _95 * _321;
    float _375 = _95 * _335;
    float _377 = fma(_305, _359, _357);
    if (_339)
    {
        float _379 = _363 * _371;
        _365 = _379;
    }
    float _381 = _365;
    float _383 = fma(_303, _359, _373);
    float _385 = fma(_307, _359, _375);
    float _387 = 0.0 + _381;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    out.m_54.x = _383;
    out.m_54.y = _377;
    out.m_54.z = _385;
    out.m_54.w = _389;
    return out;
}

