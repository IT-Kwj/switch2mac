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
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4), flat]];
    float4 m_37 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _484 = float2(_77, _79);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = in.m_39.x;
    float _91 = in.m_37.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = _89 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _105 = _89 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _107 = _75 * _95;
    float _109 = _75 * _101;
    float _111 = fma(_85, 2.0, -1.0);
    float _113 = fma(_87, 2.0, -1.0);
    float _115 = fma(_103, _111, _107);
    float _117 = fma(_105, _113, _109);
    float2 _548;
    _548.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_115, _117));
    _548.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_115, _117));
    float _119 = _548.x;
    float _121 = _119 * 256.0;
    int _124 = int(_121);
    float _126 = in.m_41.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_41.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_41.y;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = _75 * _130;
    float _146 = _75 * _136;
    float _148 = _75 * _142;
    float _150 = 1.0 / _144;
    float _152 = _146 * _150;
    float _154 = _148 * _150;
    float2 _596 = float2(_152, _154);
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_596, float2(0.0), isnan(_596))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_596, float2(0.0), isnan(_596))).x;
    float _158 = float(uint(_124));
    float _160 = _158 * 0.00390625;
    float _162 = precise::min(_160, 2.0);
    float2 _612 = float2(_115, _117);
    float4 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_612, float2(0.0), isnan(_612)), level(_162)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_612, float2(0.0), isnan(_612)), level(_162)).xyzw;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = _165.w;
    float _175 = in.m_41.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_43.w;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_45.w;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_47.w;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _201 = _75 * _179;
    float _203 = in.m_49.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = _201 * _150;
    float _211 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _213 = fma(_209, (*spvDescriptorSet0.fp_c8)._m0[30].w, _211);
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _217 = fma(_156, (*spvDescriptorSet0.fp_c8)._m0[30].w, _215);
    float _219 = _75 * _185;
    float _221 = _75 * _191;
    float _223 = 1.0 / _213;
    float _225 = 1.0 / _217;
    float _227 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _229 = _223 * _227;
    float _231 = _75 * _207;
    float _233 = in.m_43.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_47.z;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_45.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_45.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_45.z;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = _75 * _243;
    float _265 = -_219;
    float _267 = fma(_173, _221, _265);
    float _269 = _75 * _197;
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _273 = -_229;
    float _275 = fma(_225, _271, _273);
    float _277 = _269 * _267;
    float _279 = _275 * _199;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = 0.0 + _277;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _285 * _281;
    float _289 = _287 * _231;
    bool _293 = _289 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _295 = isnan(_289);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _301 = _297 || _299;
    float _303 = in.m_47.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_43.x;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_43.y;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_47.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    if (!_301)
    {
        discard_fragment();
    }
    float _327 = _75 * _307;
    float _329 = _75 * _313;
    float _331 = _75 * _319;
    float _333 = _75 * _325;
    float _335 = _75 * _237;
    float _337 = -_327;
    float _339 = _329 + _337;
    float _341 = -_333;
    float _343 = _331 + _341;
    float _345 = -_263;
    float _347 = _335 + _345;
    float _349 = fma(_167, _339, _327);
    float _351 = _75 * _255;
    float _353 = fma(_169, _343, _333);
    float _355 = fma(_171, _347, _263);
    float _357 = _75 * _249;
    float _359 = _75 * _261;
    float _361 = _353 * _351;
    float _363 = _349 * _357;
    float _365 = _355 * _359;
    if (!_301)
    {
        out.m_52.x = _363;
        out.m_52.y = _361;
        out.m_52.z = _365;
        out.m_52.w = _277;
        return out;
    }
    float _367 = _361 * 0.715200006961822509765625;
    float _369 = in.m_54.w;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_54.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_54.y;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = fma(_363, 0.2125999927520751953125, _367);
    float _389 = in.m_54.z;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = fma(_365, 0.072200000286102294921875, _387);
    bool _397 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _399 = 1.0 / _395;
    float _401 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_397)
    {
        float _403 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _405 = _229 + _403;
        _401 = _405;
    }
    float _407 = _401;
    float _409 = _399 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _411 = precise::clamp(_409, 0.0, 1.0);
    float _413 = fma(_411, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _415 = _75 * _373;
    float _417 = _75 * _385;
    float _419 = _413 * _415;
    float _421 = 0.0 + _289;
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
    float _435 = _75 * _379;
    float _437 = _75 * _393;
    float _439 = fma(_361, _419, _417);
    if (_397)
    {
        float _441 = _423 * _433;
        _427 = _441;
    }
    float _443 = _427;
    float _445 = fma(_363, _419, _435);
    float _447 = fma(_365, _419, _437);
    float _449 = 0.0 + _443;
    float _451 = precise::clamp(_449, 0.0, 1.0);
    out.m_52.x = _445;
    out.m_52.y = _439;
    out.m_52.z = _447;
    out.m_52.w = _451;
    return out;
}

