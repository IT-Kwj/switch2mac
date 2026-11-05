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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
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
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _61;
    float _101 = _99 * _67;
    float _103 = _99 * _73;
    float _105 = _99 * _79;
    float _107 = _99 * _85;
    float _109 = _99 * _91;
    float _111 = _99 * _97;
    float2 _489 = float2(_101, _107);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_489, float2(0.0), isnan(_489))).w;
    float2 _500 = float2(_103, _105);
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_500, float2(0.0), isnan(_500))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float2 _516 = float2(_109, _111);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_516, float2(0.0), isnan(_516))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float _136 = in.m_41.w;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_43.w;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_45.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_47.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _99 * _140;
    float _162 = _99 * _146;
    float _164 = _99 * _152;
    float _166 = in.m_45.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_41.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_45.z;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_43.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_43.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_43.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = -_113;
    float _204 = fma(_124, _134, _202);
    float _206 = -_160;
    float _208 = fma(_204, _162, _206);
    float _210 = _164 * _208;
    float _212 = _99 * _158;
    float _214 = 0.0 + _210;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _216 * _212;
    bool _222 = _218 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _224 = isnan(_218);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _230 = _226 || _228;
    float _232 = in.m_41.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_41.x;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_45.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    if (!_230)
    {
        discard_fragment();
    }
    float _250 = _118 * _118;
    float _252 = _120 * _120;
    float _254 = _250 * _128;
    float _256 = _252 * _130;
    float _258 = _122 * _122;
    float _260 = _99 * _170;
    float _262 = _99 * _176;
    float _264 = _258 * _132;
    float _266 = _99 * _236;
    float _268 = _99 * _242;
    float _270 = _99 * _248;
    float _272 = _99 * _182;
    float _274 = -_260;
    float _276 = _266 + _274;
    float _278 = -_270;
    float _280 = _268 + _278;
    float _282 = -_272;
    float _284 = _262 + _282;
    float _286 = fma(_256, _276, _260);
    float _288 = fma(_254, _280, _270);
    float _290 = fma(_264, _284, _272);
    float _292 = _99 * _188;
    float _294 = _99 * _194;
    float _296 = _99 * _200;
    float _298 = _288 * _292;
    float _300 = _286 * _294;
    float _302 = _290 * _296;
    if (!_230)
    {
        out.m_50.x = _298;
        out.m_50.y = _300;
        out.m_50.z = _302;
        out.m_50.w = _210;
        return out;
    }
    float _304 = _300 * 0.715200006961822509765625;
    float _306 = in.m_52.w;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_52.z;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_52.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = fma(_298, 0.2125999927520751953125, _304);
    float _326 = in.m_52.y;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = fma(_302, 0.072200000286102294921875, _324);
    bool _334 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _336 = 1.0 / _332;
    float _338 = _336 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = _99 * _310;
    float _344 = fma(_340, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _346 = _99 * _316;
    float _348 = _344 * _342;
    float _350 = 0.0 + _218;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    float _354 = _99 * _322;
    float _356 = _99 * _330;
    float _358 = fma(_302, _348, _346);
    float _360 = fma(_298, _348, _354);
    float _362 = fma(_300, _348, _356);
    float _364 = _346;
    if (!_334)
    {
        _364 = _352;
    }
    float _366 = _364;
    bool _368 = !_334;
    float _370 = _366;
    if (!_368)
    {
        float _372 = in.m_54.w;
        float _374 = gl_FragCoord.w;
        float _376 = _372 * _374;
        float _378 = in.m_54.z;
        float _380 = gl_FragCoord.w;
        float _382 = _378 * _380;
        float _384 = _99 * _376;
        float _386 = _99 * _382;
        float _388 = 1.0 / _384;
        float _390 = _386 * _388;
        float _392 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _394 = fma(_390, (*spvDescriptorSet0.fp_c8)._m0[30].w, _392);
        float _396 = 1.0 / _394;
        float _398 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _400 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _402 = fma(_396, _398, _400);
        float _404 = _402 * 8.0;
        float _406 = precise::clamp(_404, 0.0, 1.0);
        float _408 = _352 * _406;
        _370 = _408;
    }
    float _410 = _370;
    float _412 = 0.0 + _410;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    out.m_50.x = _360;
    out.m_50.y = _362;
    out.m_50.z = _358;
    out.m_50.w = _414;
    return out;
}

