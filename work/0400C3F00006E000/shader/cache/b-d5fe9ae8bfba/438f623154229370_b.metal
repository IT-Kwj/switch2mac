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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_35 [[user(locn2), flat]];
    float4 m_43 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_37 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.y;
    float _61 = in.m_37.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.z;
    float _83 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _85 = 1.0 / _57;
    float _87 = -_59;
    float _89 = _87 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _91 = -_67;
    float _93 = _91 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _95 = _89 * _89;
    float _97 = -_81;
    float _99 = _97 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _101 = fma(_93, _93, _95);
    float _103 = fma(_99, _99, _101);
    float _105 = _85 * _65;
    float _107 = _85 * _73;
    float _109 = _85 * _79;
    float _111 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _83);
    float _113 = _105 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _115 = rsqrt(_103);
    float _117 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _111);
    float _119 = fma(_107, (*spvDescriptorSet0.fp_c8)._m0[2].x, _113);
    float _121 = _105 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _123 = -_67;
    float _125 = _107 + _123;
    float _127 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[2].z, _119);
    float _129 = rsqrt(_117);
    float _131 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _133 = -_59;
    float _135 = _105 + _133;
    float _137 = _127 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _139 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _141 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _143 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _131);
    float _145 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _139);
    float _147 = 1.0 / _137;
    float _149 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _141);
    float _151 = _105 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _153 = -_81;
    float _155 = _109 + _153;
    float _157 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _143);
    float _159 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _149);
    float _161 = fma(_107, (*spvDescriptorSet0.fp_c8)._m0[0].x, _151);
    float _163 = fma(_107, (*spvDescriptorSet0.fp_c8)._m0[1].x, _121);
    float _165 = _93 * _115;
    float _167 = _159 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _169 = _89 * _115;
    float _171 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[0].z, _161);
    float _173 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[1].z, _163);
    float _175 = _99 * _115;
    float _177 = _129 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _179 = in.m_39.z;
    float _181 = _167 * _147;
    float _183 = _129 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _185 = _129 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _187 = _177 * _165;
    float _189 = in.m_39.w;
    float _191 = _183 * _169;
    float _193 = _185 * _175;
    float _195 = -_187;
    float _197 = fma(_185, _169, _195);
    float _199 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _145);
    float _201 = -_191;
    float _203 = fma(_177, _175, _201);
    float _205 = -_193;
    float _207 = fma(_183, _165, _205);
    float _209 = _173 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _211 = _165 * _197;
    float _213 = _169 * _203;
    float _215 = _175 * _207;
    float _217 = _157 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _219 = -_211;
    float _221 = fma(_175, _203, _219);
    float _223 = -_213;
    float _225 = fma(_165, _207, _223);
    float _227 = _207 * _135;
    float _229 = -_215;
    float _231 = fma(_169, _197, _229);
    float _233 = _135 * _221;
    float _235 = -_217;
    float _237 = fma(_209, _181, _235);
    float _239 = fma(_203, _125, _227);
    float _241 = _199 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _243 = _171 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _245 = fma(_125, _231, _233);
    float _247 = fma(_197, _155, _239);
    float _249 = -_241;
    float _251 = fma(_243, _181, _249);
    float _253 = _237 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _255 = fma(_155, _225, _245);
    float _257 = (*spvDescriptorSet0.fp_c9)._m0[191].x * 0.100000001490116119384765625;
    float _259 = _247 + 0.5;
    float _261 = _251 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _263 = _253 * 0.707106769084930419921875;
    float _265 = -_255;
    float _267 = _265 + 0.5;
    float _269 = fma(_259, _257, _179);
    float _271 = -_263;
    float _273 = fma(_261, 0.707106769084930419921875, _271);
    float _275 = fma(_261, 0.707106769084930419921875, _263);
    float _277 = fma(_267, _257, _189);
    float2 _852 = float2(_269, _277);
    float _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_852, float2(0.0), isnan(_852))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_852, float2(0.0), isnan(_852))).w;
    float2 _863 = float2(_273, _275);
    float4 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_863, float2(0.0), isnan(_863))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_863, float2(0.0), isnan(_863))).xyzw;
    float _284 = _282.x;
    float _286 = _282.y;
    float _288 = _282.z;
    float _290 = _282.w;
    float _292 = in.m_41.w;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_43.w;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = in.m_45.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = _85 * _296;
    float _312 = _85 * _302;
    float _314 = _85 * _308;
    float _316 = in.m_41.y;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_41.x;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_47.z;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_41.z;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = fma(_279, -0.699999988079071044921875, 1.0);
    float _342 = _310 * _290;
    float _344 = _342 * _340;
    float _346 = _344 * _312;
    float _348 = precise::max(_346, 0.1500000059604644775390625);
    float _350 = precise::min(_348, 0.17000000178813934326171875);
    float _352 = fma(_350, 50.000011444091796875, -7.5000019073486328125);
    float _354 = 0.0 + _352;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _356 * _314;
    bool _362 = _358 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _364 = isnan(_358);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _370 = _366 || _368;
    float _372 = in.m_47.x;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_47.y;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    if (!_370)
    {
        discard_fragment();
    }
    float _384 = precise::max(_344, 0.1500000059604644775390625);
    float _386 = _85 * _326;
    float _388 = _85 * _320;
    float _390 = _284 * _284;
    float _392 = precise::min(_384, 0.20000000298023223876953125);
    float _394 = _286 * _286;
    float _396 = _288 * _288;
    float _398 = fma(_392, 20.0000019073486328125, -3.000000476837158203125);
    float _400 = _85 * _376;
    float _402 = _85 * _382;
    float _404 = _85 * _332;
    float _406 = _85 * _338;
    float _408 = -_400;
    float _410 = _408 + _386;
    float _412 = -_402;
    float _414 = _412 + _388;
    float _416 = -_404;
    float _418 = _416 + _406;
    float _420 = fma(_398, _410, _400);
    float _422 = fma(_398, _414, _402);
    float _424 = _390 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _426 = fma(_398, _418, _404);
    float _428 = _394 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _430 = _420 + _422;
    float _432 = _396 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _434 = _426 + _430;
    float _436 = -_420;
    float _438 = fma(_434, 0.3300000131130218505859375, _436);
    float _440 = -_422;
    float _442 = fma(_434, 0.3300000131130218505859375, _440);
    float _444 = -_426;
    float _446 = fma(_434, 0.3300000131130218505859375, _444);
    float _448 = fma(_424, _438, _420);
    float _450 = fma(_428, _442, _422);
    float _452 = fma(_432, _446, _426);
    if (!_370)
    {
        out.m_50.x = _448;
        out.m_50.y = _450;
        out.m_50.z = _452;
        out.m_50.w = _352;
        return out;
    }
    float _454 = 0.0 + _358;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    out.m_50.x = _448;
    out.m_50.y = _450;
    out.m_50.z = _452;
    out.m_50.w = _456;
    return out;
}

