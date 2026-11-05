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
    float4 m_45 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_41 [[user(locn5), flat]];
    float4 m_49 [[user(locn6)]];
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
    float2 _480 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_480, float2(0.0), isnan(_480))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_480, float2(0.0), isnan(_480))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_41.x;
    float _93 = in.m_39.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _107 = _77 * _97;
    float _109 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _111 = _77 * _103;
    float _113 = _87 * _87;
    float _115 = _89 * _89;
    float _117 = fma(_105, _113, _111);
    float _119 = fma(_109, _115, _107);
    float2 _544;
    _544.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_117, _119));
    _544.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_117, _119));
    float _121 = _544.x;
    float _123 = _121 * 256.0;
    int _126 = int(_123);
    float _128 = in.m_43.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_43.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_43.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = _77 * _132;
    float _148 = _77 * _138;
    float _150 = _77 * _144;
    float _152 = 1.0 / _146;
    float _154 = _148 * _152;
    float _156 = _150 * _152;
    float2 _592 = float2(_154, _156);
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_592, float2(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_592, float2(0.0), isnan(_592))).x;
    float _160 = float(uint(_126));
    float _162 = _160 * 0.00390625;
    float _164 = precise::min(_162, 2.0);
    float2 _609 = float2(_117, _119);
    float4 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_609, float2(0.0), isnan(_609)), level(_164)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_609, float2(0.0), isnan(_609)), level(_164)).xyzw;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = _167.w;
    float _177 = in.m_43.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_45.w;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = _77 * _181;
    float _191 = in.m_47.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = _189 * _152;
    float _199 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_197, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_158, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = 1.0 / _203;
    float _211 = 1.0 / _207;
    float _213 = _77 * _187;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _217 = _209 * _215;
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _221 = -_217;
    float _223 = fma(_211, _219, _221);
    float _225 = _223 * _199;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = _77 * _195;
    float _231 = in.m_49.y;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _77 * _235;
    float _239 = _175 * _213;
    float _241 = 0.0 + _239;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = _243 * _227;
    float _247 = _245 * _229;
    bool _251 = _247 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _253 = isnan(_247);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _259 = _255 || _257;
    float _261 = in.m_49.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = _217;
    if (!_259)
    {
        discard_fragment();
    }
    float _269 = _77 * _265;
    float2 _758 = float2(_269, _237);
    float3 _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_758, float2(0.0), isnan(_758))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_758, float2(0.0), isnan(_758))).xyz;
    float _275 = _273.x;
    float _277 = _273.y;
    float _279 = _273.z;
    float _281 = in.m_45.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_45.y;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_51.x;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_51.y;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_45.z;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_51.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = _171 * _171;
    float _319 = _169 * _169;
    float _321 = _173 * _173;
    float _323 = _77 * _297;
    float _325 = _77 * _315;
    float _327 = _275 * _275;
    float _329 = _277 * _277;
    float _331 = _279 * _279;
    float _333 = _319 * _327;
    float _335 = _317 * _329;
    float _337 = _77 * _285;
    float _339 = _77 * _291;
    float _341 = _77 * _303;
    float _343 = _77 * _309;
    float _345 = _321 * _331;
    float _347 = -_323;
    float _349 = _337 + _347;
    float _351 = -_341;
    float _353 = _339 + _351;
    float _355 = -_325;
    float _357 = _343 + _355;
    float _359 = fma(_333, _349, _323);
    float _361 = fma(_335, _353, _341);
    float _363 = fma(_345, _357, _325);
    if (!_259)
    {
        out.m_54.x = _359;
        out.m_54.y = _361;
        out.m_54.z = _363;
        out.m_54.w = _239;
        return out;
    }
    float _365 = _361 * 0.715200006961822509765625;
    float _367 = in.m_56.w;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_56.x;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_56.y;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = fma(_359, 0.2125999927520751953125, _365);
    float _387 = in.m_56.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = fma(_363, 0.072200000286102294921875, _385);
    bool _395 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _397 = 1.0 / _393;
    float _399 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_395)
    {
        float _401 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _403 = _217 + _401;
        _267 = _403;
    }
    float _405 = _267;
    float _407 = _397 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = fma(_409, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _413 = _77 * _371;
    if (_395)
    {
        float _415 = _405 * 8.0;
        float _417 = precise::clamp(_415, 0.0, 1.0);
        _399 = _417;
    }
    float _419 = _399;
    float _421 = _77 * _383;
    float _423 = _411 * _413;
    float _425 = 0.0 + _247;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = _77 * _377;
    float _431 = _77 * _391;
    float _433 = fma(_361, _423, _421);
    float _435 = _427;
    if (_395)
    {
        float _437 = _427 * _419;
        _435 = _437;
    }
    float _439 = _435;
    float _441 = fma(_359, _423, _429);
    float _443 = fma(_363, _423, _431);
    float _445 = 0.0 + _439;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    out.m_54.x = _441;
    out.m_54.y = _433;
    out.m_54.z = _443;
    out.m_54.w = _447;
    return out;
}

