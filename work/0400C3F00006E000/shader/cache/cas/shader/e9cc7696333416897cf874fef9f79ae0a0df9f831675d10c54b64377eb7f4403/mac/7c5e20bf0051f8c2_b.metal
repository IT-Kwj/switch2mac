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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_41 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_41.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_41.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_41.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _81 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _79);
    float _83 = 1.0 / _59;
    float _85 = _83 * _65;
    float _87 = _83 * _71;
    float _89 = _83 * _77;
    float _91 = _85 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _93 = fma(_87, (*spvDescriptorSet0.fp_c8)._m0[2].x, _91);
    float _95 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[2].z, _93);
    float _97 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _81);
    float _99 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _101 = _95 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _103 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _105 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _107 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _99);
    float _109 = _85 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _111 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _103);
    float _113 = 1.0 / _101;
    float _115 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _105);
    float _117 = _85 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _119 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _111);
    float _121 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _107);
    float _123 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _115);
    float _125 = fma(_87, (*spvDescriptorSet0.fp_c8)._m0[0].x, _109);
    float _127 = fma(_87, (*spvDescriptorSet0.fp_c8)._m0[1].x, _117);
    float _129 = rsqrt(_97);
    float _131 = _123 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _133 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[0].z, _125);
    float _135 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[1].z, _127);
    float _137 = _119 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _139 = _121 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _141 = _133 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _143 = _135 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _145 = _131 * _113;
    float _147 = -_137;
    float _149 = fma(_141, _145, _147);
    float _151 = -_145;
    float _153 = fma(_143, _151, _139);
    float _155 = _129 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _157 = fma(_149, _155, 0.5);
    float _159 = fma(_153, _155, 0.5);
    float2 _668 = float2(_157, _159);
    float2 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_668, float2(0.0), isnan(_668))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_668, float2(0.0), isnan(_668))).xw;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = in.m_43.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_43.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_43.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_45.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_45.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _83 * _173;
    float _201 = _83 * _179;
    float _203 = _83 * _185;
    float _205 = _83 * _191;
    float _207 = 1.0 / _199;
    float _209 = _201 * _207;
    float _211 = _203 * _207;
    float _213 = _83 * _197;
    float _215 = fma(_167, (*spvDescriptorSet0.fp_c9)._m0[194].w, _205);
    float2 _746 = float2(_209, _211);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_746, float2(0.0), isnan(_746))).x;
    float2 _754 = float2(_213, _215);
    float2 _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_754, float2(0.0), isnan(_754))).xw;
    float _221 = _219.x;
    float _223 = _219.y;
    float _225 = in.m_43.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = _153 * _129;
    float _233 = _149 * _129;
    float _235 = _231 * _231;
    float _237 = fma(_233, _233, _235);
    float _239 = in.m_47.x;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = sqrt(_237);
    float _247 = _83 * _229;
    float _249 = _247 * _207;
    float _251 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _253 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _255 = fma(_249, (*spvDescriptorSet0.fp_c8)._m0[30].w, _253);
    float _257 = 0.0 + _245;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = -_259;
    float _263 = _261 + 1.0;
    float _265 = 1.0 / _255;
    float _267 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _269 = _265 * _267;
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _273 = fma(_217, (*spvDescriptorSet0.fp_c8)._m0[30].w, _271);
    float _275 = _263 * _263;
    float _277 = fma(_275, 0.39999997615814208984375, 0.60000002384185791015625);
    float _279 = 1.0 / _273;
    float _281 = _223 * _277;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = _83 * _243;
    float _287 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _289 = -_269;
    float _291 = fma(_279, _287, _289);
    float _293 = _291 * _251;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _283 * _295;
    float _299 = _297 * _285;
    bool _303 = _299 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _305 = isnan(_299);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _311 = _307 || _309;
    float _313 = _275 * 0.5;
    float _315 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.0166666693985462188720703125, _313);
    if (!_311)
    {
        discard_fragment();
    }
    float2 _902 = float2(_275, _315);
    float3 _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_902, float2(0.0), isnan(_902))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_902, float2(0.0), isnan(_902))).xyz;
    float _321 = _319.x;
    float _323 = _319.y;
    float _325 = _319.z;
    float _327 = _165 * _165;
    float _329 = _221 * _221;
    float _331 = _327 * _329;
    float _333 = fma(_275, _331, _275);
    float _335 = _333 * 1.5;
    float _337 = _275 * _275;
    float _339 = _337 * _337;
    float _341 = _339 * 0.25;
    float _343 = _321 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _345 = _323 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _347 = _325 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _349 = _343 * _335;
    float _351 = _345 * _335;
    float _353 = _347 * _335;
    float _355 = fma(_343, 0.5, _349);
    float _357 = fma(_345, 0.5, _351);
    float _359 = fma(_347, 0.5, _353);
    float _361 = fma(_341, (*spvDescriptorSet0.fp_c9)._m0[106].x, _355);
    float _363 = fma(_341, (*spvDescriptorSet0.fp_c9)._m0[106].x, _357);
    float _365 = fma(_341, (*spvDescriptorSet0.fp_c9)._m0[106].x, _359);
    if (!_311)
    {
        out.m_50.x = _361;
        out.m_50.y = _363;
        out.m_50.z = _365;
        out.m_50.w = _283;
        return out;
    }
    float _367 = _363 * 0.715200006961822509765625;
    float _369 = in.m_52.w;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_52.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_52.y;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = fma(_361, 0.2125999927520751953125, _367);
    float _389 = in.m_52.z;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = fma(_365, 0.072200000286102294921875, _387);
    bool _397 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _399 = 1.0 / _395;
    float _401 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_397)
    {
        float _403 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _405 = _269 + _403;
        _401 = _405;
    }
    float _407 = _401;
    float _409 = _399 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _411 = precise::clamp(_409, 0.0, 1.0);
    float _413 = fma(_411, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _415 = _83 * _373;
    float _417 = _83 * _385;
    float _419 = _413 * _415;
    float _421 = 0.0 + _299;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = _415;
    float _427 = _423;
    if (_397)
    {
        float _429 = _407 * 8.0;
        float _431 = precise::clamp(_429, 0.0, 1.0);
        _425 = _431;
    }
    float _433 = _425;
    float _435 = _83 * _379;
    float _437 = _83 * _393;
    float _439 = fma(_363, _419, _417);
    if (_397)
    {
        float _441 = _423 * _433;
        _427 = _441;
    }
    float _443 = _427;
    float _445 = fma(_361, _419, _435);
    float _447 = fma(_365, _419, _437);
    float _449 = 0.0 + _443;
    float _451 = precise::clamp(_449, 0.0, 1.0);
    out.m_50.x = _445;
    out.m_50.y = _439;
    out.m_50.z = _447;
    out.m_50.w = _451;
    return out;
}

