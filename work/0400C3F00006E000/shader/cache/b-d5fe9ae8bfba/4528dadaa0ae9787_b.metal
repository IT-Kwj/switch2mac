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
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_38.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_38.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _502 = float2(_86, _88);
    float4 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).xyzw;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float _99 = _91.w;
    float _101 = in.m_40.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_42.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _84 * _105;
    float _115 = in.m_44.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_40.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_44.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_40.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_44.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _84 * _119;
    float _147 = _84 * _131;
    float _149 = _84 * _137;
    float _151 = _99 * _113;
    float _153 = _84 * _111;
    float _155 = 0.0 + _151;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 * _153;
    bool _162 = _159 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _164 = isnan(_159);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _170 = _166 || _168;
    float _172 = in.m_40.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    if (!_170)
    {
        discard_fragment();
    }
    float _178 = _93 * _93;
    float _180 = _95 * _95;
    float _182 = _84 * _176;
    float _184 = _84 * _125;
    float _186 = _84 * _143;
    float _188 = -_145;
    float _190 = _182 + _188;
    float _192 = -_147;
    float _194 = _184 + _192;
    float _196 = -_186;
    float _198 = _149 + _196;
    float _200 = _97 * _97;
    float _202 = fma(_178, _190, _145);
    float _204 = fma(_180, _194, _147);
    float _206 = fma(_200, _198, _186);
    if (!_170)
    {
        out.m_47.x = _202;
        out.m_47.y = _204;
        out.m_47.z = _206;
        out.m_47.w = _151;
        return out;
    }
    float _208 = in.m_49.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _216 = in.m_49.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_49.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_55.x;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = _84 * _212;
    bool _236 = as_type<int>(_214) != 0;
    float _238 = _84 * _220;
    bool _240 = !_236;
    float _242 = -_234;
    float _244 = _240 ? _242 : _234;
    float _246 = _84 * _226;
    bool _248 = !_236;
    float _250 = -_238;
    float _252 = _248 ? _250 : _238;
    float _254 = _244 * _244;
    bool _256 = !_236;
    float _258 = -_246;
    float _260 = _256 ? _258 : _246;
    float _262 = fma(_252, _252, _254);
    float _264 = fma(_260, _260, _262);
    float _266 = rsqrt(_264);
    float _268 = _252 * _266;
    float _270 = _244 * _266;
    float _272 = _260 * _266;
    float _274 = abs(_268);
    float _276 = abs(_270);
    float _278 = precise::max(_274, _276);
    float _280 = abs(_272);
    float _282 = precise::max(_280, _278);
    float _284 = _84 * _232;
    float _286 = 1.0 / _282;
    float _288 = precise::min(_284, 1.0);
    float _290 = -_286;
    float _292 = _272 * _290;
    float _294 = _268 * _286;
    float _296 = _270 * _286;
    float3 _804 = float3(_294, _296, _292);
    float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_804, float3(0.0), isnan(_804)), level(_288)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_804, float3(0.0), isnan(_804)), level(_288)).xyz;
    float _302 = _300.x;
    float _304 = _300.y;
    float _306 = _300.z;
    float _308 = in.m_57.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_57.z;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_57.x;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_59.y;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_59.z;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_59.x;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = in.m_61.x;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_61.w;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_61.y;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_61.z;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = _84 * _312;
    float _370 = _84 * _318;
    float _372 = _84 * _324;
    bool _374 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _376 = fma(_304, 0.20999999344348907470703125, _368);
    float _378 = fma(_306, 0.20999999344348907470703125, _370);
    float _380 = fma(_302, 0.20999999344348907470703125, _372);
    float _382 = _84 * _330;
    float _384 = _84 * _336;
    float _386 = _84 * _342;
    float _388 = _376 + _382;
    float _390 = _378 + _384;
    float _392 = _380 + _386;
    float _394 = _84 * _354;
    float _396 = _204 * _388;
    float _398 = _206 * _390;
    float _400 = _202 * _392;
    float _402 = 0.0 + _159;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = _84 * _348;
    float _408 = _84 * _360;
    float _410 = _84 * _366;
    float _412 = fma(_400, _394, _406);
    float _414 = fma(_396, _394, _408);
    float _416 = fma(_398, _394, _410);
    float _418 = _406;
    if (!_374)
    {
        _418 = _404;
    }
    float _420 = _418;
    bool _422 = !_374;
    float _424 = _420;
    if (!_422)
    {
        float _426 = in.m_63.w;
        float _428 = gl_FragCoord.w;
        float _430 = _426 * _428;
        float _432 = in.m_63.z;
        float _434 = gl_FragCoord.w;
        float _436 = _432 * _434;
        float _438 = _84 * _430;
        float _440 = _84 * _436;
        float _442 = 1.0 / _438;
        float _444 = _440 * _442;
        float _446 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _448 = fma(_444, (*spvDescriptorSet0.fp_c8)._m0[30].w, _446);
        float _450 = 1.0 / _448;
        float _452 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _454 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _456 = fma(_450, _452, _454);
        float _458 = _456 * 8.0;
        float _460 = precise::clamp(_458, 0.0, 1.0);
        float _462 = _404 * _460;
        _424 = _462;
    }
    float _464 = _424;
    float _466 = 0.0 + _464;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    out.m_47.x = _412;
    out.m_47.y = _414;
    out.m_47.z = _416;
    out.m_47.w = _468;
    return out;
}

