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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
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
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _55;
    float _83 = _81 * _61;
    float _85 = _81 * _67;
    float _87 = _81 * _73;
    float _89 = fma(_83, 0.75, -0.75);
    float _91 = fma(_85, 0.75, -0.75);
    float _93 = _81 * _79;
    float _95 = _89 * 0.707106769084930419921875;
    float _97 = -_95;
    float _99 = fma(_91, 0.707106769084930419921875, _97);
    float _101 = fma(_91, 0.707106769084930419921875, _95);
    float2 _481;
    _481.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_87, _93));
    _481.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_87, _93));
    float _103 = _481.x;
    float _105 = _103 * 256.0;
    int _108 = int(_105);
    float _110 = _99 + 1.0;
    float _112 = _101 + 1.0;
    float2 _496;
    _496.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_110, _112));
    _496.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_110, _112));
    float _114 = _496.x;
    float _116 = _114 * 256.0;
    int _118 = int(_116);
    float _120 = in.m_39.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_39.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_39.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _81 * _124;
    float _140 = _81 * _130;
    float _142 = _81 * _136;
    float _144 = 1.0 / _138;
    float _146 = _140 * _144;
    float _148 = _142 * _144;
    float2 _543 = float2(_146, _148);
    float _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_543, float2(0.0), isnan(_543))).x;
    float _152 = float(uint(_108));
    float _154 = _152 * 0.00390625;
    float _156 = float(uint(_118));
    float _158 = precise::min(_154, 2.0);
    float _160 = _156 * 0.00390625;
    float2 _568 = float2(_87, _93);
    float _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568)), level(_158)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_568, float2(0.0), isnan(_568)), level(_158)).w;
    float _164 = precise::min(_160, 2.0);
    float2 _579 = float2(_110, _112);
    float4 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_579, float2(0.0), isnan(_579)), level(_164)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_579, float2(0.0), isnan(_579)), level(_164)).xyzw;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = _167.w;
    float _177 = in.m_39.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_41.w;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = _81 * _181;
    float _191 = in.m_43.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = _189 * _144;
    float _199 = _81 * _187;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_197, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = in.m_45.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = fma(_199, 0.23999999463558197021484375, 0.00999999977648258209228515625);
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _215 = fma(_150, (*spvDescriptorSet0.fp_c8)._m0[30].w, _213);
    float _217 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _219 = 1.0 / _203;
    float _221 = 1.0 / _215;
    float _223 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _225 = _219 * _223;
    float _227 = _81 * _195;
    float _229 = _81 * _209;
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _233 = -_225;
    float _235 = fma(_221, _231, _233);
    float _237 = _235 * _217;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = in.m_41.x;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_41.z;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_43.y;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_43.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = _81 * _245;
    float _267 = _81 * _257;
    bool _271 = _162 >= _211;
    bool _273 = isnan(_162);
    bool _275 = _271 || _273;
    bool _277 = isnan(_211);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = fma(_175, _227, _281);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _285 * _239;
    float _289 = _287 * _229;
    bool _291 = _289 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _293 = isnan(_289);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _299 = _295 || _297;
    float _301 = in.m_43.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_41.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _225;
    float _315 = _289;
    if (!_299)
    {
        discard_fragment();
    }
    float _317 = _169 * _169;
    float _319 = _171 * _171;
    float _321 = _173 * _173;
    float _323 = _319 * _319;
    float _325 = _81 * _305;
    float _327 = _81 * _311;
    float _329 = _317 * _317;
    float _331 = _321 * _321;
    float _333 = _81 * _251;
    float _335 = -_323;
    float _337 = _335 + 1.0;
    float _339 = -_329;
    float _341 = _339 + 1.0;
    float _343 = -_331;
    float _345 = _343 + 1.0;
    float _347 = _81 * _263;
    float _349 = _327 * _337;
    float _351 = _265 * _341;
    float _353 = _333 * _345;
    float _355 = fma(_323, _267, _349);
    float _357 = fma(_329, _325, _351);
    float _359 = fma(_331, _347, _353);
    if (!_299)
    {
        out.m_48.x = _357;
        out.m_48.y = _355;
        out.m_48.z = _359;
        out.m_48.w = _285;
        return out;
    }
    float _361 = _355 * 0.715200006961822509765625;
    float _363 = fma(_357, 0.2125999927520751953125, _361);
    float _365 = fma(_359, 0.072200000286102294921875, _363);
    bool _367 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _369 = 1.0 / _365;
    float _371 = 0.0 + _289;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = _373;
    if (_367)
    {
        float _377 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _379 = _225 + _377;
        _313 = _379;
    }
    float _381 = _313;
    float _383 = _369 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    if (_367)
    {
        float _387 = _381 * 8.0;
        float _389 = precise::clamp(_387, 0.0, 1.0);
        _315 = _389;
    }
    float _391 = _315;
    float _393 = fma(_385, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_367)
    {
        float _395 = _373 * _391;
        _375 = _395;
    }
    float _397 = _375;
    float _399 = _357 * _393;
    float _401 = _355 * _393;
    float _403 = _359 * _393;
    float _405 = 0.0 + _397;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    out.m_48.x = _399;
    out.m_48.y = _401;
    out.m_48.z = _403;
    out.m_48.w = _407;
    return out;
}

