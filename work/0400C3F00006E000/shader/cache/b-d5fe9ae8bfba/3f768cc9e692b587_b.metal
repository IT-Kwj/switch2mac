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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_ESmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].x, -0.5);
    float _63 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[2].y, -0.5);
    float _65 = floor(_61);
    float _67 = floor(_63);
    float _69 = -_65;
    float _71 = _61 + _69;
    float _73 = -_71;
    float _75 = _73 + 1.0;
    float _77 = -_71;
    float _79 = _77 + 2.0;
    float _81 = -_71;
    float _83 = _81 + 3.0;
    float _85 = -_67;
    float _87 = _63 + _85;
    float _89 = _75 * _75;
    float _91 = _79 * _79;
    float _93 = -_87;
    float _95 = _93 + 2.0;
    float _97 = -_87;
    float _99 = _97 + 1.0;
    float _101 = _75 * _89;
    float _103 = _79 * _91;
    float _105 = _95 * _95;
    float _107 = _99 * _99;
    float _109 = -_87;
    float _111 = _109 + 3.0;
    float _113 = _103 * 4.0;
    float _115 = _95 * _105;
    float _117 = fma(_101, -4.0, _103);
    float _119 = -_101;
    float _121 = _119 + 6.0;
    float _123 = _99 * _107;
    float _125 = _83 * _83;
    float _127 = _111 * _111;
    float _129 = -_117;
    float _131 = _129 + _121;
    float _133 = fma(_123, -4.0, _115);
    float _135 = -_123;
    float _137 = _135 + 6.0;
    float _139 = _115 * 4.0;
    float _141 = _131 * 0.16666667163372039794921875;
    float _143 = _123 + _133;
    float _145 = -_133;
    float _147 = _145 + _137;
    float _149 = _101 + _117;
    float _151 = -_113;
    float _153 = fma(_83, _125, _151);
    float _155 = _143 * 0.16666667163372039794921875;
    float _157 = _147 * 0.16666667163372039794921875;
    float _159 = _149 * 0.16666667163372039794921875;
    float _161 = 1.0 / _141;
    float _163 = -_139;
    float _165 = fma(_111, _127, _163);
    float _167 = fma(_101, 6.0, _153);
    float _169 = _65 + (-0.5);
    float _171 = _65 + 1.5;
    float _173 = fma(_123, 6.0, _165);
    float _175 = -_167;
    float _177 = _175 + _131;
    float _179 = _67 + (-0.5);
    float _181 = 1.0 / _159;
    float _183 = -_173;
    float _185 = _183 + _147;
    float _187 = _117 * 0.16666667163372039794921875;
    float _189 = _133 * 0.16666667163372039794921875;
    float _191 = _177 * 0.16666667163372039794921875;
    float _193 = _67 + 1.5;
    float _195 = _185 * 0.16666667163372039794921875;
    float _197 = 1.0 / _155;
    float _199 = fma(_191, _161, _171);
    float _201 = 1.0 / _157;
    float _203 = fma(_187, _181, _169);
    float _205 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _207 = fma(_189, _197, _179);
    float _209 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _211 = fma(_195, _201, _193);
    float2 _617 = float2(_57, _59);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_617, float2(0.0), isnan(_617))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_617, float2(0.0), isnan(_617))).x;
    float _215 = _203 * _205;
    float _217 = _199 * _205;
    float _219 = _207 * _209;
    float _221 = _211 * _209;
    float2 _640 = float2(_215, _219);
    float4 _224 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_640, float2(0.0), isnan(_640))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_640, float2(0.0), isnan(_640))).xyzw;
    float _226 = _224.x;
    float _228 = _224.y;
    float _230 = _224.z;
    float _232 = _224.w;
    float2 _656 = float2(_217, _219);
    float4 _234 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_656, float2(0.0), isnan(_656))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_656, float2(0.0), isnan(_656))).xyzw;
    float _236 = _234.x;
    float _238 = _234.y;
    float _240 = _234.z;
    float _242 = _234.w;
    float2 _672 = float2(_215, _221);
    float4 _244 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_672, float2(0.0), isnan(_672))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_672, float2(0.0), isnan(_672))).xyzw;
    float _246 = _244.x;
    float _248 = _244.y;
    float _250 = _244.z;
    float _252 = _244.w;
    float2 _688 = float2(_217, _221);
    float4 _254 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_688, float2(0.0), isnan(_688))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_688, float2(0.0), isnan(_688))).xyzw;
    float _256 = _254.x;
    float _258 = _254.y;
    float _260 = _254.z;
    float _262 = _254.w;
    float _264 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _266 = -_213;
    float _268 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _270 = _268 * _264;
    float _272 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _274 = -_270;
    float _276 = -_272;
    float _278 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].z, _276);
    float _280 = precise::max(0.0, _278);
    float _282 = -_242;
    float _284 = _232 + _282;
    float _286 = -_236;
    float _288 = _226 + _286;
    float _290 = -_262;
    float _292 = _252 + _290;
    float _294 = _280 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _296 = fma(_159, _284, _242);
    float _298 = fma(_159, _288, _236);
    float _300 = fma(_159, _292, _262);
    float _302 = -_238;
    float _304 = _228 + _302;
    float _306 = _294 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _308 = -_256;
    float _310 = _246 + _308;
    float _312 = -_300;
    float _314 = _312 + _296;
    float _316 = fma(_159, _304, _238);
    float _318 = -_258;
    float _320 = _248 + _318;
    float _322 = -_240;
    float _324 = _230 + _322;
    float _326 = fma(_155, _314, _300);
    float _328 = -_260;
    float _330 = _250 + _328;
    float _332 = fma(_159, _310, _256);
    float _334 = fma(_159, _320, _258);
    float _336 = precise::max(_306, -0.00999999977648258209228515625);
    float _338 = fma(_159, _324, _240);
    bool _342 = _326 > 0.0;
    float _344 = fma(_159, _330, _260);
    float _346 = -_332;
    float _348 = _346 + _298;
    float _350 = -_334;
    float _352 = _350 + _316;
    float _354 = _342 ? _326 : 1.0;
    float _356 = -_344;
    float _358 = _356 + _338;
    float _360 = precise::min(_336, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _362 = fma(_155, _348, _332);
    float _364 = fma(_155, _352, _334);
    float _366 = fma(_155, _358, _344);
    float _368 = 1.0 / _354;
    float _370 = _342 ? _360 : 0.0;
    float _372 = 0.0 + _370;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _362 * _368;
    float _378 = _364 * _368;
    float _380 = _366 * _368;
    out.m_34.x = _376;
    out.m_34.y = _378;
    out.m_34.z = _380;
    out.m_34.w = _374;
    return out;
}

