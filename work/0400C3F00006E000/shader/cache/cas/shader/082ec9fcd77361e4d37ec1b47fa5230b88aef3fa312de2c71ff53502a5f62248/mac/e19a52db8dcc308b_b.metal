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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    sampler fp_t_tcb_CSmplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _55 = 1.0 / _39;
    float _57 = _55 * _45;
    float _59 = _55 * _51;
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
    float _93 = _83 * _83;
    float _95 = -_87;
    float _97 = _95 + 1.0;
    float _99 = -_87;
    float _101 = _99 + 2.0;
    float _103 = _75 * _89;
    float _105 = _79 * _91;
    float _107 = _97 * _97;
    float _109 = _101 * _101;
    float _111 = -_103;
    float _113 = _111 + 6.0;
    float _115 = -_87;
    float _117 = _115 + 3.0;
    float _119 = _97 * _107;
    float _121 = _101 * _109;
    float _123 = fma(_103, -4.0, _105);
    float _125 = _105 * 4.0;
    float _127 = -_119;
    float _129 = _127 + 6.0;
    float _131 = fma(_119, -4.0, _121);
    float _133 = -_123;
    float _135 = _133 + _113;
    float _137 = _103 + _123;
    float _139 = _117 * _117;
    float _141 = -_131;
    float _143 = _141 + _129;
    float _145 = _119 + _131;
    float _147 = _135 * 0.16666667163372039794921875;
    float _149 = _137 * 0.16666667163372039794921875;
    float _151 = _143 * 0.16666667163372039794921875;
    float _153 = _145 * 0.16666667163372039794921875;
    float _155 = _121 * 4.0;
    float _157 = 1.0 / _149;
    float _159 = -_125;
    float _161 = fma(_83, _93, _159);
    float _163 = _65 + 1.5;
    float _165 = -_155;
    float _167 = fma(_117, _139, _165);
    float _169 = _123 * 0.16666667163372039794921875;
    float _171 = fma(_103, 6.0, _161);
    float _173 = _65 + (-0.5);
    float _175 = fma(_119, 6.0, _167);
    float _177 = 1.0 / _153;
    float _179 = -_171;
    float _181 = _179 + _135;
    float _183 = _67 + (-0.5);
    float _185 = -_175;
    float _187 = _185 + _143;
    float _189 = _131 * 0.16666667163372039794921875;
    float _191 = _181 * 0.16666667163372039794921875;
    float _193 = _67 + 1.5;
    float _195 = _187 * 0.16666667163372039794921875;
    float _197 = 1.0 / _147;
    float _199 = fma(_169, _157, _173);
    float _201 = 1.0 / _151;
    float _203 = fma(_189, _177, _183);
    float _205 = _203 * _53;
    float _207 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _209 = fma(_191, _197, _163);
    float _211 = fma(_195, _201, _193);
    float _213 = _211 * _53;
    float _215 = _199 * _207;
    float _217 = _209 * _207;
    float2 _597 = float2(_215, _205);
    float4 _220 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_597, float2(0.0), isnan(_597))).xyzw;
    float _222 = _220.x;
    float _224 = _220.y;
    float _226 = _220.z;
    float _228 = _220.w;
    float2 _616 = float2(_217, _205);
    float4 _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_616, float2(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_616, float2(0.0), isnan(_616))).xyzw;
    float _232 = _230.x;
    float _234 = _230.y;
    float _236 = _230.z;
    float _238 = _230.w;
    float2 _632 = float2(_215, _213);
    float4 _240 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_632, float2(0.0), isnan(_632))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_632, float2(0.0), isnan(_632))).xyzw;
    float _242 = _240.x;
    float _244 = _240.y;
    float _246 = _240.z;
    float _248 = _240.w;
    float2 _648 = float2(_217, _213);
    float4 _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_648, float2(0.0), isnan(_648))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_648, float2(0.0), isnan(_648))).xyzw;
    float _252 = _250.x;
    float _254 = _250.y;
    float _256 = _250.z;
    float _258 = _250.w;
    float _260 = -_238;
    float _262 = _228 + _260;
    float _264 = -_232;
    float _266 = _222 + _264;
    float _268 = -_258;
    float _270 = _248 + _268;
    float _272 = -_254;
    float _274 = _244 + _272;
    float _276 = fma(_149, _262, _238);
    float _278 = -_236;
    float _280 = _226 + _278;
    float _282 = fma(_149, _270, _258);
    float _284 = -_234;
    float _286 = _224 + _284;
    float _288 = -_252;
    float _290 = _242 + _288;
    float _292 = -_256;
    float _294 = _246 + _292;
    float _296 = -_282;
    float _298 = _296 + _276;
    float _300 = fma(_149, _266, _232);
    float _302 = fma(_149, _286, _234);
    float _304 = fma(_149, _290, _252);
    float _306 = fma(_153, _298, _282);
    float _308 = fma(_149, _274, _254);
    float _310 = fma(_149, _280, _236);
    float _312 = fma(_149, _294, _256);
    float _314 = -_304;
    float _316 = _314 + _300;
    bool _320 = _306 > 0.0;
    float _322 = -_308;
    float _324 = _322 + _302;
    float _326 = -_312;
    float _328 = _326 + _310;
    float _330 = fma(_153, _316, _304);
    float _332 = _320 ? _306 : 1.0;
    float _334 = fma(_153, _324, _308);
    float _336 = fma(_153, _328, _312);
    float _338 = _306 * 0.5;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = 1.0 / _332;
    float _344 = _330 * _342;
    float _346 = _334 * _342;
    float _348 = _336 * _342;
    out.m_32.x = _344;
    out.m_32.y = _346;
    out.m_32.z = _348;
    out.m_32.w = _340;
    return out;
}

