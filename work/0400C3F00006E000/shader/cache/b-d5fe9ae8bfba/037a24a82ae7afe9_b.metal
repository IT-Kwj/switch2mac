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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _430;
    _430.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_71, _73));
    _430.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_71, _73));
    float _75 = _430.x;
    float _77 = _75 * 256.0;
    int _80 = int(_77);
    float _82 = in.m_39.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_37.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_37.z;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_39.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_39.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = _69 * _86;
    float _114 = _69 * _92;
    float _116 = _69 * _98;
    float _118 = 1.0 / _112;
    float _120 = fma(_114, 0.75, -0.75);
    float _122 = fma(_116, 0.75, -0.75);
    float _124 = _69 * _110;
    float _126 = _120 * 0.707106769084930419921875;
    float _128 = -_126;
    float _130 = fma(_122, 0.707106769084930419921875, _128);
    float _132 = fma(_122, 0.707106769084930419921875, _126);
    float _134 = _69 * _104;
    float _136 = _130 + 1.0;
    float _138 = _134 * _118;
    float _140 = _124 * _118;
    float _142 = _132 + 1.0;
    float2 _521 = float2(_138, _140);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_521, float2(0.0), isnan(_521))).x;
    float _146 = float(uint(_80));
    float _148 = _146 * 0.00390625;
    float _150 = precise::min(_148, 2.0);
    float2 _541 = float2(_71, _73);
    float _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_541, float2(0.0), isnan(_541)), level(_150)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_541, float2(0.0), isnan(_541)), level(_150)).w;
    float2 _550 = float2(_136, _142);
    float4 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_550, float2(0.0), isnan(_550))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_550, float2(0.0), isnan(_550))).xyzw;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float _163 = _155.w;
    float _165 = in.m_39.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_41.w;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_43.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _69 * _169;
    float _185 = in.m_45.w;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = _183 * _118;
    float _193 = _69 * _175;
    float _195 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _199 = fma(_191, (*spvDescriptorSet0.fp_c8)._m0[30].w, _197);
    float _201 = fma(_193, 0.23999999463558197021484375, 0.00999999977648258209228515625);
    float _203 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _205 = fma(_144, (*spvDescriptorSet0.fp_c8)._m0[30].w, _203);
    float _207 = 1.0 / _199;
    float _209 = 1.0 / _205;
    float _211 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _213 = _207 * _211;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _217 = -_213;
    float _219 = fma(_209, _215, _217);
    float _221 = in.m_41.z;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_45.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _69 * _231;
    bool _237 = _152 >= _201;
    bool _239 = isnan(_152);
    bool _241 = _237 || _239;
    bool _243 = isnan(_201);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = _69 * _189;
    float _251 = fma(_163, _249, _247);
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _219 * _195;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = _69 * _181;
    float _261 = _253 * _257;
    float _263 = _261 * _259;
    bool _265 = _263 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _267 = isnan(_263);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _273 = _269 || _271;
    float _275 = in.m_45.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_41.y;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_41.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_45.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = _213;
    if (!_273)
    {
        discard_fragment();
    }
    float _301 = _157 * _157;
    float _303 = _159 * _159;
    float _305 = _161 * _161;
    float _307 = _303 * _303;
    float _309 = _69 * _279;
    float _311 = _69 * _285;
    float _313 = _301 * _301;
    float _315 = _305 * _305;
    float _317 = _69 * _291;
    float _319 = _69 * _225;
    float _321 = -_313;
    float _323 = _321 + 1.0;
    float _325 = -_307;
    float _327 = _325 + 1.0;
    float _329 = -_315;
    float _331 = _329 + 1.0;
    float _333 = _69 * _297;
    float _335 = _317 * _323;
    float _337 = _311 * _327;
    float _339 = _319 * _331;
    float _341 = fma(_313, _309, _335);
    float _343 = fma(_307, _233, _337);
    float _345 = fma(_315, _333, _339);
    if (!_273)
    {
        out.m_48.x = _341;
        out.m_48.y = _343;
        out.m_48.z = _345;
        out.m_48.w = _253;
        return out;
    }
    float _347 = _343 * 0.715200006961822509765625;
    float _349 = fma(_341, 0.2125999927520751953125, _347);
    float _351 = fma(_345, 0.072200000286102294921875, _349);
    bool _353 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _355 = 1.0 / _351;
    float _357 = 0.0 + _263;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = _359;
    if (_353)
    {
        float _363 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _365 = _213 + _363;
        _299 = _365;
    }
    float _367 = _299;
    float _369 = _355 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = _367;
    if (_353)
    {
        float _375 = _367 * 8.0;
        float _377 = precise::clamp(_375, 0.0, 1.0);
        _373 = _377;
    }
    float _379 = _373;
    float _381 = fma(_371, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_353)
    {
        float _383 = _359 * _379;
        _361 = _383;
    }
    float _385 = _361;
    float _387 = _341 * _381;
    float _389 = _343 * _381;
    float _391 = _345 * _381;
    float _393 = 0.0 + _385;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    out.m_48.x = _387;
    out.m_48.y = _389;
    out.m_48.z = _391;
    out.m_48.w = _395;
    return out;
}

