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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_39 [[user(locn4), flat]];
    float4 m_37 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _424 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_424, float2(0.0), isnan(_424))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_424, float2(0.0), isnan(_424))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_39.x;
    float _93 = in.m_37.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.w;
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
    float2 _488;
    _488.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_117, _119));
    _488.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_117, _119));
    float _121 = _488.x;
    float _123 = _121 * 256.0;
    int _126 = int(_123);
    float _128 = in.m_41.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_41.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = _77 * _132;
    float _142 = _77 * _138;
    float2 _518 = float2(_142, _140);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_518, float2(0.0), isnan(_518))).w;
    float _146 = float(uint(_126));
    float _148 = _146 * 0.00390625;
    float _150 = precise::min(_148, 2.0);
    float2 _534 = float2(_117, _119);
    float4 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_534, float2(0.0), isnan(_534)), level(_150)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_534, float2(0.0), isnan(_534)), level(_150)).xyzw;
    float _155 = _153.x;
    float _157 = _153.y;
    float _159 = _153.z;
    float _161 = _153.w;
    float _163 = in.m_43.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_45.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_47.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_49.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = _77 * _167;
    float _189 = in.m_45.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_45.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_43.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _77 * _193;
    float _209 = _161 * _144;
    float _211 = _209 * _187;
    float _213 = _77 * _173;
    float _215 = _77 * _179;
    float _217 = _213 * _211;
    float _219 = _215 * _217;
    float _221 = _77 * _185;
    float _223 = 0.0 + _219;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = _225 * _221;
    bool _231 = _227 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _233 = isnan(_227);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _239 = _235 || _237;
    float _241 = in.m_45.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_43.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_43.y;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    if (!_239)
    {
        discard_fragment();
    }
    float _259 = _155 * _207;
    float _261 = _77 * _245;
    float _263 = _77 * _199;
    float _265 = _77 * _257;
    float _267 = _157 * _261;
    float _269 = _159 * _263;
    float _271 = _77 * _251;
    float _273 = _77 * _205;
    float _275 = _259 * _271;
    float _277 = _267 * _265;
    float _279 = _269 * _273;
    if (!_239)
    {
        out.m_52.x = _275;
        out.m_52.y = _277;
        out.m_52.z = _279;
        out.m_52.w = _219;
        return out;
    }
    float _281 = _277 * 0.715200006961822509765625;
    float _283 = in.m_54.w;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_54.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_54.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = fma(_275, 0.2125999927520751953125, _281);
    float _303 = in.m_54.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = fma(_279, 0.072200000286102294921875, _301);
    bool _311 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _313 = 1.0 / _309;
    float _315 = _313 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = _77 * _287;
    float _321 = fma(_317, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _323 = _77 * _293;
    float _325 = _321 * _319;
    float _327 = 0.0 + _227;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = _77 * _299;
    float _333 = _77 * _307;
    float _335 = fma(_279, _325, _323);
    float _337 = fma(_275, _325, _331);
    float _339 = fma(_277, _325, _333);
    float _341 = _323;
    if (!_311)
    {
        _341 = _329;
    }
    float _343 = _341;
    bool _345 = !_311;
    float _347 = _343;
    if (!_345)
    {
        float _349 = in.m_56.w;
        float _351 = gl_FragCoord.w;
        float _353 = _349 * _351;
        float _355 = in.m_56.z;
        float _357 = gl_FragCoord.w;
        float _359 = _355 * _357;
        float _361 = _77 * _353;
        float _363 = _77 * _359;
        float _365 = 1.0 / _361;
        float _367 = _363 * _365;
        float _369 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _371 = fma(_367, (*spvDescriptorSet0.fp_c8)._m0[30].w, _369);
        float _373 = 1.0 / _371;
        float _375 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _377 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _379 = fma(_373, _375, _377);
        float _381 = _379 * 8.0;
        float _383 = precise::clamp(_381, 0.0, 1.0);
        float _385 = _329 * _383;
        _347 = _385;
    }
    float _387 = _347;
    float _389 = 0.0 + _387;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    out.m_52.x = _337;
    out.m_52.y = _339;
    out.m_52.z = _335;
    out.m_52.w = _391;
    return out;
}

