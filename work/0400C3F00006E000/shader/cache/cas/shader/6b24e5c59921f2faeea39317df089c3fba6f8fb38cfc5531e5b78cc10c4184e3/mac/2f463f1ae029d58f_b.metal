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
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_58 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_41.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_41.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_41.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_43.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_43.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _65;
    float _99 = _97 * _71;
    float _101 = _97 * _77;
    float _103 = _97 * _83;
    float _105 = _97 * _95;
    float _107 = 1.0 / _99;
    float _109 = _101 * _107;
    float _111 = _103 * _107;
    float _113 = _97 * _89;
    float2 _516 = float2(_109, _111);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float2 _527 = float2(_113, _105);
    float2 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).xw;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = in.m_45.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_45.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_45.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_47.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_47.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_47.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _97 * _129;
    float _163 = _97 * _135;
    float _165 = _97 * _141;
    float _167 = _161 * _161;
    float _169 = in.m_41.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = fma(_163, _163, _167);
    float _177 = fma(_165, _165, _175);
    float _179 = _97 * _147;
    float _181 = rsqrt(_177);
    float _183 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _185 = _183 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _187 = 1.0 / _185;
    float _189 = in.m_49.w;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = _161 * _181;
    float _197 = _163 * _181;
    float _199 = _165 * _181;
    float _201 = in.m_51.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _179 * _195;
    float _209 = _97 * _153;
    float _211 = fma(_209, _197, _207);
    float _213 = _97 * _159;
    float _215 = fma(_213, _199, _211);
    float _217 = _97 * _173;
    float _219 = in.m_53.w;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = abs(_215);
    float _227 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _229 = _225 + _227;
    float _231 = _217 * _107;
    float _233 = _229 * _187;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _239 = fma(_231, (*spvDescriptorSet0.fp_c8)._m0[30].w, _237);
    float _241 = fma(_235, -2.0, 3.0);
    float _243 = _235 * _235;
    float _245 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _247 = _241 * _243;
    float _249 = _97 * _193;
    float _251 = 1.0 / _239;
    float _253 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _255 = _251 * _253;
    float _257 = in.m_43.w;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = _97 * _261;
    float _265 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _267 = fma(_115, (*spvDescriptorSet0.fp_c8)._m0[30].w, _265);
    float _269 = 1.0 / _267;
    float _271 = -_249;
    float _273 = _123 + _271;
    float _275 = _97 * _223;
    float _277 = _273 * _275;
    float _279 = _97 * _205;
    float _281 = 0.0 + _277;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _287 = -_255;
    float _289 = fma(_269, _285, _287);
    float _291 = _289 * _245;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = _283 * _293;
    float _297 = _295 * _247;
    float _299 = _297 * _279;
    bool _303 = _299 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _305 = isnan(_299);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _311 = _307 || _309;
    float _313 = in.m_43.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = _255;
    float _321 = _299;
    if (!_311)
    {
        discard_fragment();
    }
    float _323 = _105 * _105;
    float _325 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 0.0416666679084300994873046875, 0.0199999995529651641845703125);
    float _327 = _105 * _323;
    float _329 = _97 * _317;
    float2 _830 = float2(_329, _263);
    float _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_830, float2(0.0), isnan(_830))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_830, float2(0.0), isnan(_830))).w;
    float2 _838 = float2(_327, _325);
    float3 _335 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_838, float2(0.0), isnan(_838))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_838, float2(0.0), isnan(_838))).xyz;
    float _337 = _335.x;
    float _339 = _335.y;
    float _341 = _335.z;
    float _343 = precise::max(0.0, _331);
    float _345 = precise::min(_343, 0.5);
    float _347 = _345 * 0.20000000298023223876953125;
    float _349 = fma(_121, _121, _347);
    float _351 = fma(_327, _327, _337);
    float _353 = fma(_327, _327, _339);
    float _355 = fma(_327, _327, _341);
    float _357 = _349 + 1.0;
    float _359 = _351 * _357;
    float _361 = _353 * _357;
    float _363 = _355 * _357;
    if (!_311)
    {
        out.m_56.x = _359;
        out.m_56.y = _361;
        out.m_56.z = _363;
        out.m_56.w = _277;
        return out;
    }
    float _365 = _361 * 0.715200006961822509765625;
    float _367 = in.m_58.w;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_58.x;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_58.y;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = fma(_359, 0.2125999927520751953125, _365);
    float _387 = in.m_58.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = fma(_363, 0.072200000286102294921875, _385);
    bool _395 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _397 = 1.0 / _393;
    if (_395)
    {
        float _399 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _401 = _255 + _399;
        _319 = _401;
    }
    float _403 = _319;
    float _405 = _397 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    float _409 = fma(_407, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _411 = _97 * _371;
    float _413 = _97 * _383;
    float _415 = _409 * _411;
    float _417 = 0.0 + _299;
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = _419;
    if (_395)
    {
        float _423 = _403 * 8.0;
        float _425 = precise::clamp(_423, 0.0, 1.0);
        _321 = _425;
    }
    float _427 = _321;
    float _429 = _97 * _377;
    float _431 = _97 * _391;
    float _433 = fma(_361, _415, _413);
    if (_395)
    {
        float _435 = _419 * _427;
        _421 = _435;
    }
    float _437 = _421;
    float _439 = fma(_359, _415, _429);
    float _441 = fma(_363, _415, _431);
    float _443 = 0.0 + _437;
    float _445 = precise::clamp(_443, 0.0, 1.0);
    out.m_56.x = _439;
    out.m_56.y = _433;
    out.m_56.z = _441;
    out.m_56.w = _445;
    return out;
}

