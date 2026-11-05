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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4), flat]];
    float4 m_35 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_41 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _522 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_522, float2(0.0), isnan(_522))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_37.x;
    float _93 = in.m_35.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _107 = _77 * _97;
    float _109 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _111 = _77 * _103;
    float _113 = fma(_87, 2.0, -1.0);
    float _115 = fma(_89, 2.0, -1.0);
    float _117 = fma(_105, _113, _107);
    float _119 = fma(_109, _115, _111);
    float2 _586;
    _586.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_117, _119));
    _586.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_117, _119));
    float _121 = _586.x;
    float _123 = _121 * 256.0;
    int _126 = int(_123);
    float _128 = float(uint(_126));
    float _130 = _128 * 0.00390625;
    float _132 = precise::min(_130, 2.0);
    float2 _604 = float2(_117, _119);
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_604, float2(0.0), isnan(_604)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_604, float2(0.0), isnan(_604)), level(_132)).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float _145 = in.m_39.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_39.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_39.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_41.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_41.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_41.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_43.w;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = _77 * _149;
    float _189 = _77 * _155;
    float _191 = _77 * _161;
    float _193 = _187 * _187;
    float _195 = fma(_189, _189, _193);
    float _197 = fma(_191, _191, _195);
    float _199 = _77 * _167;
    float _201 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _203 = _201 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _205 = in.m_45.w;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = rsqrt(_197);
    float _213 = in.m_47.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = _187 * _211;
    float _221 = _189 * _211;
    float _223 = _199 * _219;
    float _225 = _77 * _173;
    float _227 = _191 * _211;
    float _229 = 1.0 / _203;
    float _231 = fma(_225, _221, _223);
    float _233 = _77 * _179;
    float _235 = fma(_233, _227, _231);
    float _237 = abs(_235);
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _241 = _237 + _239;
    float _243 = _241 * _229;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _77 * _217;
    float _249 = fma(_245, -2.0, 3.0);
    float _251 = _245 * _245;
    float _253 = _77 * _185;
    float _255 = _249 * _251;
    float _257 = in.m_49.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_45.y;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_45.z;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_49.z;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_43.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_43.y;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_43.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = _77 * _261;
    float _301 = _77 * _273;
    float _303 = _143 * _253;
    float _305 = _77 * _209;
    float _307 = _305 * _303;
    float _309 = 0.0 + _307;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = _311 * _255;
    float _315 = _313 * _247;
    bool _319 = _315 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _321 = isnan(_315);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _327 = _323 || _325;
    float _329 = in.m_45.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_49.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    if (!_327)
    {
        discard_fragment();
    }
    float _341 = _77 * _333;
    float _343 = _77 * _267;
    float _345 = _77 * _339;
    float _347 = _77 * _279;
    float _349 = -_299;
    float _351 = _341 + _349;
    float _353 = -_345;
    float _355 = _343 + _353;
    float _357 = -_347;
    float _359 = _301 + _357;
    float _361 = fma(_137, _351, _299);
    float _363 = _77 * _291;
    float _365 = fma(_139, _355, _345);
    float _367 = fma(_141, _359, _347);
    float _369 = _77 * _285;
    float _371 = _77 * _297;
    float _373 = _365 * _363;
    float _375 = _361 * _369;
    float _377 = _367 * _371;
    if (!_327)
    {
        out.m_52.x = _375;
        out.m_52.y = _373;
        out.m_52.z = _377;
        out.m_52.w = _307;
        return out;
    }
    float _379 = _373 * 0.715200006961822509765625;
    float _381 = in.m_54.w;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_54.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_54.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = fma(_375, 0.2125999927520751953125, _379);
    float _401 = in.m_54.y;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = fma(_377, 0.072200000286102294921875, _399);
    bool _409 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _411 = 1.0 / _407;
    float _413 = _411 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = _77 * _385;
    float _419 = fma(_415, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _421 = _77 * _391;
    float _423 = _419 * _417;
    float _425 = 0.0 + _315;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = _77 * _397;
    float _431 = _77 * _405;
    float _433 = fma(_377, _423, _421);
    float _435 = fma(_375, _423, _429);
    float _437 = fma(_373, _423, _431);
    float _439 = _421;
    if (!_409)
    {
        _439 = _427;
    }
    float _441 = _439;
    bool _443 = !_409;
    float _445 = _441;
    if (!_443)
    {
        float _447 = in.m_56.w;
        float _449 = gl_FragCoord.w;
        float _451 = _447 * _449;
        float _453 = in.m_56.z;
        float _455 = gl_FragCoord.w;
        float _457 = _453 * _455;
        float _459 = _77 * _451;
        float _461 = _77 * _457;
        float _463 = 1.0 / _459;
        float _465 = _461 * _463;
        float _467 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _469 = fma(_465, (*spvDescriptorSet0.fp_c8)._m0[30].w, _467);
        float _471 = 1.0 / _469;
        float _473 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _475 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _477 = fma(_471, _473, _475);
        float _479 = _477 * 8.0;
        float _481 = precise::clamp(_479, 0.0, 1.0);
        float _483 = _427 * _481;
        _445 = _483;
    }
    float _485 = _445;
    float _487 = 0.0 + _485;
    float _489 = precise::clamp(_487, 0.0, 1.0);
    out.m_52.x = _435;
    out.m_52.y = _437;
    out.m_52.z = _433;
    out.m_52.w = _489;
    return out;
}

