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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = 1.0 / _59;
    float _105 = _103 * _65;
    float _107 = _103 * _71;
    float _109 = _103 * _77;
    float _111 = _103 * _83;
    float _113 = 1.0 / _105;
    float _115 = _103 * _89;
    float _117 = _103 * _95;
    float _119 = _103 * _101;
    float _121 = _107 * _113;
    float _123 = _109 * _113;
    float2 _521 = float2(_121, _123);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_521, float2(0.0), isnan(_521))).x;
    float2 _532 = float2(_111, _115);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_532, float2(0.0), isnan(_532))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float2 _548 = float2(_117, _119);
    float4 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_548, float2(0.0), isnan(_548))).xyzw;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = _138.w;
    float _148 = in.m_37.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_43.w;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_45.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _174 = _103 * _152;
    float _176 = _174 * _113;
    float _178 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _180 = fma(_176, (*spvDescriptorSet0.fp_c8)._m0[30].w, _178);
    float _182 = 1.0 / _180;
    float _184 = in.m_47.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_47.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_47.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_41.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_41.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _216 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[30].w, _214);
    float _218 = _103 * _158;
    float _220 = 1.0 / _216;
    float _222 = _136 * _146;
    float _224 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _226 = _182 * _224;
    float _228 = _222 * _218;
    float _230 = _103 * _164;
    float _232 = _230 * _228;
    float _234 = 0.0 + _232;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _240 = -_226;
    float _242 = fma(_220, _238, _240);
    float _244 = _103 * _170;
    float _246 = _242 * _172;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _236 * _248;
    float _252 = _250 * _244;
    bool _256 = _252 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _258 = isnan(_252);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _264 = _260 || _262;
    float _266 = in.m_43.x;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_43.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_43.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_41.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = _226;
    if (!_264)
    {
        discard_fragment();
    }
    float _292 = _140 * _140;
    float _294 = _142 * _142;
    float _296 = _103 * _188;
    float _298 = _130 * _292;
    float _300 = _132 * _294;
    float _302 = _144 * _144;
    float _304 = _134 * _302;
    float _306 = _103 * _206;
    float _308 = _103 * _270;
    float _310 = _103 * _276;
    float _312 = _103 * _194;
    float _314 = _103 * _282;
    float _316 = _103 * _200;
    float _318 = -_296;
    float _320 = _308 + _318;
    float _322 = -_312;
    float _324 = _310 + _322;
    float _326 = -_316;
    float _328 = _314 + _326;
    float _330 = fma(_298, _320, _296);
    float _332 = fma(_300, _324, _312);
    float _334 = _103 * _212;
    float _336 = fma(_304, _328, _316);
    float _338 = _103 * _288;
    float _340 = _330 * _306;
    float _342 = _332 * _334;
    float _344 = _336 * _338;
    float _346 = _328;
    if (!_264)
    {
        out.m_50.x = _340;
        out.m_50.y = _342;
        out.m_50.z = _344;
        out.m_50.w = _232;
        return out;
    }
    float _348 = _342 * 0.715200006961822509765625;
    float _350 = in.m_52.w;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_52.x;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_52.y;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = fma(_340, 0.2125999927520751953125, _348);
    float _370 = in.m_52.z;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = fma(_344, 0.072200000286102294921875, _368);
    bool _378 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _380 = 1.0 / _376;
    if (_378)
    {
        float _382 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _384 = _226 + _382;
        _290 = _384;
    }
    float _386 = _290;
    if (_378)
    {
        float _388 = _386 * 8.0;
        float _390 = precise::clamp(_388, 0.0, 1.0);
        _346 = _390;
    }
    float _392 = _346;
    float _394 = _380 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = fma(_396, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _400 = _103 * _354;
    float _402 = _103 * _360;
    float _404 = _103 * _366;
    float _406 = _398 * _400;
    float _408 = 0.0 + _252;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _103 * _374;
    float _414 = fma(_340, _406, _402);
    float _416 = _410;
    if (_378)
    {
        float _418 = _410 * _392;
        _416 = _418;
    }
    float _420 = _416;
    float _422 = fma(_342, _406, _404);
    float _424 = fma(_344, _406, _412);
    float _426 = 0.0 + _420;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    out.m_50.x = _414;
    out.m_50.y = _422;
    out.m_50.z = _424;
    out.m_50.w = _428;
    return out;
}

