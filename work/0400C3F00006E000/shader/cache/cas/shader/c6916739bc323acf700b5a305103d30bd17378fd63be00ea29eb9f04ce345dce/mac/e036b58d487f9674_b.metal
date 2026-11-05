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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
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
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_47 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_39.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _468 = float2(_79, _77);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_468, float2(0.0), isnan(_468))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_468, float2(0.0), isnan(_468))).w;
    float _83 = in.m_41.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_43.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_45.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _75 * _87;
    float _103 = _75 * _93;
    float _105 = _75 * _99;
    float _107 = in.m_39.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _75 * _111;
    float _115 = _101 * _81;
    float _117 = _103 * _115;
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = _119 * _105;
    bool _125 = _121 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _127 = isnan(_121);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _133 = _129 || _131;
    float _135 = in.m_39.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    if (!_133)
    {
        discard_fragment();
    }
    float _141 = _75 * _139;
    float2 _563 = float2(_113, _141);
    float2 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_563, float2(0.0), isnan(_563))).xy;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = in.m_47.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_47.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_47.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _171 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _169);
    float _173 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _171);
    float _175 = _173 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _177 = _75 * _155;
    float _179 = _75 * _161;
    float _181 = _75 * _167;
    float _183 = _177 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _185 = _177 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _187 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[2].x, _183);
    float _189 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _191 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _193 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[2].z, _187);
    float _195 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _189);
    float _197 = _177 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _199 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _191);
    float _201 = _193 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _203 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _195);
    float _205 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[0].x, _197);
    float _207 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[1].x, _185);
    float _209 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _199);
    float _211 = 1.0 / _201;
    float _213 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[0].z, _205);
    float _215 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[1].z, _207);
    float _217 = _203 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _219 = _209 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _221 = _213 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _223 = _215 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _225 = _175 * _211;
    float _227 = -_217;
    float _229 = fma(_221, _225, _227);
    float _231 = -_225;
    float _233 = fma(_223, _231, _219);
    float _235 = _147 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _237 = _149 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _239 = fma(_229, (*spvDescriptorSet0.fp_c9)._m0[194].z, _235);
    float _241 = fma(_233, (*spvDescriptorSet0.fp_c9)._m0[194].z, _237);
    float2 _761 = float2(_239, _241);
    float3 _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_761, float2(0.0), isnan(_761))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_761, float2(0.0), isnan(_761))).xyz;
    float _247 = _245.x;
    float _249 = _245.y;
    float _251 = _245.z;
    float _253 = in.m_43.y;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_43.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_43.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_41.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_41.y;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_41.z;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = _75 * _257;
    float _291 = _75 * _263;
    float _293 = _75 * _269;
    float _295 = -_247;
    float _297 = _295 + 1.0;
    float _299 = -_249;
    float _301 = _299 + 1.0;
    float _303 = -_251;
    float _305 = _303 + 1.0;
    float _307 = _293 * _297;
    float _309 = _289 * _301;
    float _311 = _291 * _305;
    float _313 = _75 * _275;
    float _315 = _75 * _281;
    float _317 = _75 * _287;
    float _319 = fma(_247, _313, _307);
    float _321 = fma(_249, _315, _309);
    float _323 = fma(_251, _317, _311);
    if (!_133)
    {
        out.m_50.x = _319;
        out.m_50.y = _321;
        out.m_50.z = _323;
        out.m_50.w = _119;
        return out;
    }
    float _325 = _321 * 0.715200006961822509765625;
    float _327 = in.m_52.w;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_52.z;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_52.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = fma(_319, 0.2125999927520751953125, _325);
    float _347 = in.m_52.y;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = fma(_323, 0.072200000286102294921875, _345);
    bool _355 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _357 = 1.0 / _353;
    float _359 = _357 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = fma(_361, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _365 = _75 * _331;
    float _367 = _75 * _337;
    float _369 = _363 * _365;
    float _371 = 0.0 + _121;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = _75 * _343;
    float _377 = _75 * _351;
    float _379 = fma(_323, _369, _367);
    float _381 = fma(_319, _369, _375);
    float _383 = fma(_321, _369, _377);
    float _385 = _367;
    if (!_355)
    {
        _385 = _373;
    }
    float _387 = _385;
    bool _389 = !_355;
    float _391 = _387;
    if (!_389)
    {
        float _393 = in.m_54.w;
        float _395 = gl_FragCoord.w;
        float _397 = _393 * _395;
        float _399 = in.m_54.z;
        float _401 = gl_FragCoord.w;
        float _403 = _399 * _401;
        float _405 = _75 * _397;
        float _407 = _75 * _403;
        float _409 = 1.0 / _405;
        float _411 = _407 * _409;
        float _413 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _415 = fma(_411, (*spvDescriptorSet0.fp_c8)._m0[30].w, _413);
        float _417 = 1.0 / _415;
        float _419 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _421 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _423 = fma(_417, _419, _421);
        float _425 = _423 * 8.0;
        float _427 = precise::clamp(_425, 0.0, 1.0);
        float _429 = _373 * _427;
        _391 = _429;
    }
    float _431 = _391;
    float _433 = 0.0 + _431;
    float _435 = precise::clamp(_433, 0.0, 1.0);
    out.m_50.x = _381;
    out.m_50.y = _383;
    out.m_50.z = _379;
    out.m_50.w = _435;
    return out;
}

