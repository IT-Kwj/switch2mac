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
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_41 [[user(locn5), flat]];
    float4 m_45 [[user(locn6)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _476 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_476, float2(0.0), isnan(_476))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_476, float2(0.0), isnan(_476))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_41.x;
    float _93 = in.m_39.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _107 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _109 = _77 * _97;
    float _111 = _77 * _103;
    float _113 = fma(_105, _87, _109);
    float _115 = fma(_107, _89, _111);
    float2 _534;
    _534.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_113, _115));
    _534.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_113, _115));
    float _117 = _534.x;
    float _119 = _117 * 256.0;
    int _122 = int(_119);
    float _124 = in.m_43.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_43.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_43.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_45.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_45.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = _77 * _128;
    float _156 = _77 * _134;
    float _158 = _77 * _140;
    float _160 = _77 * _146;
    float _162 = 1.0 / _154;
    float _164 = _77 * _152;
    float _166 = _156 * _162;
    float _168 = _158 * _162;
    float2 _602 = float2(_166, _168);
    float _170 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_602, float2(0.0), isnan(_602))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_602, float2(0.0), isnan(_602))).x;
    float2 _610 = float2(_160, _164);
    float4 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_610, float2(0.0), isnan(_610))).xyzw;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float _181 = _173.w;
    float _183 = float(uint(_122));
    float _185 = _183 * 0.00390625;
    float _187 = precise::min(_185, 2.0);
    float2 _635 = float2(_113, _115);
    float4 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_635, float2(0.0), isnan(_635)), level(_187)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_635, float2(0.0), isnan(_635)), level(_187)).xyzw;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    float _197 = _189.w;
    float _199 = in.m_43.z;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_47.w;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_49.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _219 = _77 * _203;
    float _221 = in.m_51.x;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = _219 * _162;
    float _229 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _231 = fma(_227, (*spvDescriptorSet0.fp_c8)._m0[30].w, _229);
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _235 = fma(_170, (*spvDescriptorSet0.fp_c8)._m0[30].w, _233);
    float _237 = _77 * _209;
    float _239 = _77 * _215;
    float _241 = 1.0 / _231;
    float _243 = 1.0 / _235;
    float _245 = in.m_49.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_49.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_47.z;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = -_237;
    float _265 = fma(_197, _181, _263);
    float _267 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _269 = _241 * _267;
    float _271 = _239 * _265;
    float _273 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _275 = -_269;
    float _277 = fma(_243, _273, _275);
    float _279 = 0.0 + _271;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = _277 * _217;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _77 * _225;
    float _289 = _281 * _285;
    float _291 = _289 * _287;
    bool _295 = _291 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _297 = isnan(_291);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _303 = _299 || _301;
    float _305 = in.m_47.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_47.y;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_49.z;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = _269;
    if (!_303)
    {
        discard_fragment();
    }
    float _325 = _191 * _175;
    float _327 = _193 * _177;
    float _329 = _77 * _249;
    float _331 = _77 * _255;
    float _333 = _77 * _261;
    float _335 = _77 * _309;
    float _337 = _77 * _315;
    float _339 = _77 * _321;
    float _341 = _195 * _179;
    float _343 = -_329;
    float _345 = _335 + _343;
    float _347 = -_331;
    float _349 = _337 + _347;
    float _351 = -_339;
    float _353 = _333 + _351;
    float _355 = fma(_325, _345, _329);
    float _357 = fma(_327, _349, _331);
    float _359 = fma(_341, _353, _339);
    if (!_303)
    {
        out.m_54.x = _355;
        out.m_54.y = _357;
        out.m_54.z = _359;
        out.m_54.w = _271;
        return out;
    }
    float _361 = _357 * 0.715200006961822509765625;
    float _363 = in.m_56.w;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_56.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_56.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = fma(_355, 0.2125999927520751953125, _361);
    float _383 = in.m_56.z;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = fma(_359, 0.072200000286102294921875, _381);
    bool _391 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _393 = 1.0 / _389;
    float _395 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_391)
    {
        float _397 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _399 = _269 + _397;
        _323 = _399;
    }
    float _401 = _323;
    float _403 = _393 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = fma(_405, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _409 = _77 * _367;
    if (_391)
    {
        float _411 = _401 * 8.0;
        float _413 = precise::clamp(_411, 0.0, 1.0);
        _395 = _413;
    }
    float _415 = _395;
    float _417 = _77 * _373;
    float _419 = _77 * _379;
    float _421 = _407 * _409;
    float _423 = 0.0 + _291;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    float _427 = _77 * _387;
    float _429 = fma(_355, _421, _417);
    float _431 = _425;
    if (_391)
    {
        float _433 = _425 * _415;
        _431 = _433;
    }
    float _435 = _431;
    float _437 = fma(_357, _421, _419);
    float _439 = fma(_359, _421, _427);
    float _441 = 0.0 + _435;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    out.m_54.x = _429;
    out.m_54.y = _437;
    out.m_54.z = _439;
    out.m_54.w = _443;
    return out;
}

