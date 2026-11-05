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
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_43 [[user(locn4), flat]];
    float4 m_35 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_35.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _53;
    float _87 = _85 * _59;
    float _89 = _85 * _65;
    float _91 = _85 * _71;
    float _93 = _85 * _83;
    float _95 = 1.0 / _87;
    float _97 = _89 * _95;
    float _99 = _91 * _95;
    float _101 = _85 * _77;
    float _103 = _97 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _105 = _99 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _107 = _99 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _109 = _97 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float2 _524 = float2(_103, _107);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_524, float2(0.0), isnan(_524))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_524, float2(0.0), isnan(_524))).w;
    float2 _535 = float2(_109, _105);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_535, float2(0.0), isnan(_535))).w;
    float2 _543 = float2(_101, _93);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_543, float2(0.0), isnan(_543))).w;
    float _117 = in.m_37.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_39.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_41.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _85 * _133;
    float _137 = _111 * _113;
    float _139 = precise::max(_137, -0.100000001490116119384765625);
    float _141 = precise::min(_139, 0.800000011920928955078125);
    float _143 = fma(_141, 1.11111104488372802734375, 0.111111104488372802734375);
    float _145 = _85 * _121;
    float _147 = _115 * _143;
    float _149 = _85 * _127;
    float _151 = _147 * _145;
    float _153 = _151 * _149;
    float _155 = 0.0 + _153;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 * _135;
    bool _163 = _159 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _165 = isnan(_159);
    bool _167 = _163 || _165;
    bool _169 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _171 = _167 || _169;
    float _173 = in.m_43.x;
    if (!_171)
    {
        discard_fragment();
    }
    float _175 = _173 * 2.0;
    float _177 = fma(_97, 1.5, _175);
    float _179 = fma(_99, 3.0, _175);
    float2 _644 = float2(_177, _179);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_644, float2(0.0), isnan(_644))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_644, float2(0.0), isnan(_644))).w;
    float _183 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _185 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _183;
    float _187 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _189 = _187 + (*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _191 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _193 = (*spvDescriptorSet0.fp_c9)._m0[126].w + _191;
    float _195 = -(*spvDescriptorSet0.fp_c9)._m0[126].w;
    float _197 = _195 + (*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _199 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _201 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _199;
    float _203 = 1.0 / _185;
    float _205 = -(*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _207 = (*spvDescriptorSet0.fp_c9)._m0[126].y + _205;
    float _209 = 1.0 / _189;
    float _211 = -(*spvDescriptorSet0.fp_c9)._m0[125].z;
    float _213 = (*spvDescriptorSet0.fp_c9)._m0[126].z + _211;
    float _215 = 1.0 / _197;
    float _217 = 1.0 / _193;
    float _219 = 0.0 + _181;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _225 = _221 + _223;
    float _227 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _229 = _221 + _227;
    bool _231 = _221 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _233 = isnan(_221);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _245 = _221 + _243;
    float _247 = _225 * _209;
    float _249 = _229 * _203;
    float _251 = -(*spvDescriptorSet0.fp_c9)._m0[126].w;
    float _253 = _221 + _251;
    bool _255 = _221 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _257 = isnan(_221);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _269 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _267;
    float _271 = fma(_201, _249, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _273 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _275 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _273;
    float _277 = _253 * _215;
    float _279 = fma(_269, _249, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _281 = -(*spvDescriptorSet0.fp_c9)._m0[124].x;
    float _283 = _281 + (*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _285 = fma(_275, _249, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    bool _287 = _221 >= (*spvDescriptorSet0.fp_c9)._m0[126].w;
    bool _289 = isnan(_221);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.fp_c9)._m0[126].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = -(*spvDescriptorSet0.fp_c9)._m0[124].y;
    float _301 = _299 + (*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _303 = -(*spvDescriptorSet0.fp_c9)._m0[124].z;
    float _305 = _303 + (*spvDescriptorSet0.fp_c9)._m0[125].z;
    float _307 = -_241;
    float _309 = _307 + 1.0;
    bool _311 = _221 >= (*spvDescriptorSet0.fp_c9)._m0[125].w;
    bool _313 = isnan(_221);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.fp_c9)._m0[125].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_297;
    float _325 = _323 + 1.0;
    float _327 = fma(_283, _247, (*spvDescriptorSet0.fp_c9)._m0[124].x);
    float _329 = fma(_301, _247, (*spvDescriptorSet0.fp_c9)._m0[124].y);
    float _331 = fma(_305, _247, (*spvDescriptorSet0.fp_c9)._m0[124].z);
    float _333 = _245 * _217;
    float _335 = -(*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _337 = (*spvDescriptorSet0.fp_c9)._m0[126].x + _335;
    float _339 = _265 * _309;
    float _341 = _321 * _325;
    float _343 = -_321;
    float _345 = _343 + 1.0;
    float _347 = fma(_337, _333, (*spvDescriptorSet0.fp_c9)._m0[125].x);
    float _349 = _279 * _339;
    float _351 = _285 * _339;
    float _353 = _271 * _339;
    float _355 = -_265;
    float _357 = _355 + 1.0;
    float _359 = -(*spvDescriptorSet0.fp_c9)._m0[126].x;
    float _361 = _359 + (*spvDescriptorSet0.fp_c9)._m0[127].x;
    float _363 = -(*spvDescriptorSet0.fp_c9)._m0[126].y;
    float _365 = _363 + (*spvDescriptorSet0.fp_c9)._m0[127].y;
    float _367 = -(*spvDescriptorSet0.fp_c9)._m0[126].z;
    float _369 = _367 + (*spvDescriptorSet0.fp_c9)._m0[127].z;
    bool _371 = _221 >= (*spvDescriptorSet0.fp_c9)._m0[127].w;
    bool _373 = isnan(_221);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.fp_c9)._m0[127].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = _241 * _345;
    float _385 = fma(_357, (*spvDescriptorSet0.fp_c9)._m0[123].x, _349);
    float _387 = fma(_357, (*spvDescriptorSet0.fp_c9)._m0[123].y, _351);
    float _389 = fma(_357, (*spvDescriptorSet0.fp_c9)._m0[123].z, _353);
    float _391 = fma(_207, _333, (*spvDescriptorSet0.fp_c9)._m0[125].y);
    float _393 = fma(_361, _277, (*spvDescriptorSet0.fp_c9)._m0[126].x);
    float _395 = fma(_365, _277, (*spvDescriptorSet0.fp_c9)._m0[126].y);
    float _397 = fma(_369, _277, (*spvDescriptorSet0.fp_c9)._m0[126].z);
    float _399 = fma(_213, _333, (*spvDescriptorSet0.fp_c9)._m0[125].z);
    float _401 = -_381;
    float _403 = _401 + 1.0;
    float _405 = fma(_327, _383, _385);
    float _407 = fma(_329, _383, _387);
    float _409 = fma(_331, _383, _389);
    float _411 = _297 * _403;
    float _413 = fma(_347, _341, _405);
    float _415 = fma(_391, _341, _407);
    float _417 = fma(_399, _341, _409);
    float _419 = fma(_393, _411, _413);
    float _421 = fma(_395, _411, _415);
    float _423 = fma(_397, _411, _417);
    float _425 = fma(_381, (*spvDescriptorSet0.fp_c9)._m0[127].x, _419);
    float _427 = fma(_381, (*spvDescriptorSet0.fp_c9)._m0[127].y, _421);
    float _429 = fma(_381, (*spvDescriptorSet0.fp_c9)._m0[127].z, _423);
    if (!_171)
    {
        out.m_46.x = _425;
        out.m_46.y = _427;
        out.m_46.z = _429;
        out.m_46.w = _153;
        return out;
    }
    float _431 = 0.0 + _159;
    float _433 = precise::clamp(_431, 0.0, 1.0);
    out.m_46.x = _425;
    out.m_46.y = _427;
    out.m_46.z = _429;
    out.m_46.w = _433;
    return out;
}

