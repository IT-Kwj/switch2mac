#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _939, thread const int& _940, constant _10& support_buffer)
{
    int _943 = 1 + _940;
    float _945 = support_buffer._m5[_943].x;
    float _947 = abs(_945);
    bool _949 = _947 == 1.0;
    if (_949)
    {
        return _939;
    }
    float _951 = float(_939);
    float _953 = _951 / _947;
    int _955 = int(_953);
    return _955;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _438 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_438, float2(0.0), isnan(_438))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_438, float2(0.0), isnan(_438))).x;
    float _68 = in.m_33.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = precise::max(_94, _86);
    bool _100 = _96 != 0.0;
    bool _102 = isnan(_96);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.0);
    bool _108 = _104 || _106;
    bool _110 = !_108;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_96, _112, 1.0);
        float _116 = log2(_114);
        float _118 = _116 + (-1.0);
        float _120 = trunc(_118);
        int _122 = int(_120);
        int _124 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _126 = _124;
        int _128 = 1;
        int _130 = _42(_126, _128, (*spvDescriptorSet0.support_buffer));
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _134 = _132;
        int _136 = 1;
        int _138 = _42(_134, _136, (*spvDescriptorSet0.support_buffer));
        float _140 = float(_130);
        float _142 = float(_138);
        float _144 = fma(_62, _140, -0.5);
        float _146 = fma(_64, _142, -0.5);
        float _148 = 1.0 / _140;
        float _150 = floor(_144);
        float _152 = floor(_146);
        float _154 = -_150;
        float _156 = _144 + _154;
        float _158 = -_156;
        float _160 = _158 + 1.0;
        float _162 = -_156;
        float _164 = _162 + 2.0;
        float _166 = -_152;
        float _168 = _146 + _166;
        float _170 = _160 * _160;
        float _172 = -_168;
        float _174 = _172 + 1.0;
        float _176 = _160 * _170;
        float _178 = -_168;
        float _180 = _178 + 2.0;
        float _182 = _164 * _164;
        float _184 = _174 * _174;
        float _186 = _176 * 4.0;
        float _188 = -_176;
        float _190 = _188 + 6.0;
        float _192 = _174 * _184;
        float _194 = _180 * _180;
        float _196 = -_186;
        float _198 = fma(_164, _182, _196);
        float _200 = _192 * 4.0;
        float _202 = 1.0 / _142;
        float _204 = -_198;
        float _206 = _204 + _190;
        float _208 = -_200;
        float _210 = fma(_180, _194, _208);
        float _212 = -_192;
        float _214 = _212 + 6.0;
        float _216 = _206 * 0.16666667163372039794921875;
        float _218 = _176 + _198;
        float _220 = _156 * _156;
        float _222 = -_210;
        float _224 = _222 + _214;
        float _226 = _168 * _168;
        float _228 = _218 * 0.16666667163372039794921875;
        float _230 = 1.0 / _216;
        float _232 = _224 * 0.16666667163372039794921875;
        float _234 = _192 + _210;
        float _236 = _156 * _220;
        float _238 = _168 * _226;
        float _240 = _152 + (-0.5);
        float _242 = _234 * 0.16666667163372039794921875;
        float _244 = _210 * 0.16666667163372039794921875;
        float _246 = 1.0 / _232;
        float _248 = _150 + (-0.5);
        float _250 = _150 + 1.5;
        float _252 = _152 + 1.5;
        float _254 = _236 * 0.16666667163372039794921875;
        float _256 = _238 * 0.16666667163372039794921875;
        float _258 = _198 * 0.16666667163372039794921875;
        float _260 = 1.0 / _242;
        float _262 = fma(_254, _230, _250);
        float _264 = _262 * _148;
        float _266 = 1.0 / _228;
        float _268 = fma(_256, _246, _252);
        float _270 = _268 * _202;
        float _272 = fma(_244, _260, _240);
        float _274 = _272 * _202;
        float _276 = fma(_258, _266, _248);
        float _278 = _276 * _148;
        float2 _721 = float2(_278, _274);
        float3 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_721, float2(0.0), isnan(_721)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_721, float2(0.0), isnan(_721)), level(_118)).xyz;
        float _284 = _282.x;
        float _286 = _282.y;
        float _288 = _282.z;
        float2 _736 = float2(_264, _274);
        float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_736, float2(0.0), isnan(_736)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_736, float2(0.0), isnan(_736)), level(_118)).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        float2 _751 = float2(_278, _270);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_751, float2(0.0), isnan(_751)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_751, float2(0.0), isnan(_751)), level(_118)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _766 = float2(_264, _270);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_766, float2(0.0), isnan(_766)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_766, float2(0.0), isnan(_766)), level(_118)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float _314 = -_292;
        float _316 = _284 + _314;
        float _318 = -_294;
        float _320 = _286 + _318;
        float _322 = -_308;
        float _324 = _300 + _322;
        float _326 = -_296;
        float _328 = _288 + _326;
        float _330 = -_310;
        float _332 = _302 + _330;
        float _334 = -_312;
        float _336 = _304 + _334;
        float _338 = 0.0 + _116;
        float _340 = precise::clamp(_338, 0.0, 1.0);
        float _342 = fma(_228, _316, _292);
        float _344 = fma(_228, _320, _294);
        float _346 = fma(_228, _328, _296);
        float _348 = fma(_228, _324, _308);
        float _350 = fma(_228, _332, _310);
        float _352 = fma(_228, _336, _312);
        float _354 = fma(_90, _340, _88);
        float _356 = -_348;
        float _358 = _356 + _342;
        float _360 = -_350;
        float _362 = _360 + _344;
        float _364 = -_352;
        float _366 = _364 + _346;
        float _368 = 1.0 / _354;
        float _370 = fma(_242, _358, _348);
        float _372 = fma(_242, _362, _350);
        float _374 = fma(_242, _366, _352);
        float _376 = _340 * _370;
        float _378 = _340 * _372;
        float _380 = _340 * _374;
        float _382 = -_376;
        float _384 = _382 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _386 = -_378;
        float _388 = _386 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _390 = -_380;
        float _392 = _390 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _394 = fma(_88, _384, _376);
        float _396 = fma(_88, _388, _378);
        float _398 = fma(_88, _392, _380);
        float _400 = _394 * _368;
        float _402 = _396 * _368;
        float _404 = _398 * _368;
        out.m_36.x = _400;
        out.m_36.y = _402;
        out.m_36.z = _404;
        out.m_36.w = _354;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _88;
    return out;
}

