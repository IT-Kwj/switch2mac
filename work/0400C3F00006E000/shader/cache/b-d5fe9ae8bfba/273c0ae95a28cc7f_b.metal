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
int _42(thread const int& _982, thread const int& _983, constant _10& support_buffer)
{
    int _986 = 1 + _983;
    float _988 = support_buffer._m5[_986].x;
    float _990 = abs(_988);
    bool _992 = _990 == 1.0;
    if (_992)
    {
        return _982;
    }
    float _994 = float(_982);
    float _996 = _994 / _990;
    int _998 = int(_996);
    return _998;
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
    float2 _454 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_454, float2(0.0), isnan(_454))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_454, float2(0.0), isnan(_454))).x;
    float _68 = in.m_33.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = precise::max(_94, _98);
    float _106 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = precise::max(_104, _90);
    float _112 = precise::min(_102, _108);
    bool _116 = _110 != 0.0;
    bool _118 = isnan(_110);
    bool _120 = _116 || _118;
    bool _122 = isnan(0.0);
    bool _124 = _120 || _122;
    bool _126 = !_124;
    if (!_126)
    {
        float _128 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _130 = fma(_110, _128, 1.0);
        float _132 = log2(_130);
        float _134 = _132 + (-1.0);
        float _136 = trunc(_134);
        int _138 = int(_136);
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).x;
        int _142 = _140;
        int _144 = 1;
        int _146 = _42(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).y;
        int _150 = _148;
        int _152 = 1;
        int _154 = _42(_150, _152, (*spvDescriptorSet0.support_buffer));
        float _156 = float(_154);
        float _158 = float(_146);
        float _160 = fma(_64, _156, -0.5);
        float _162 = fma(_62, _158, -0.5);
        float _164 = floor(_160);
        float _166 = floor(_162);
        float _168 = -_164;
        float _170 = _160 + _168;
        float _172 = -_170;
        float _174 = _172 + 1.0;
        float _176 = _170 * _170;
        float _178 = -_166;
        float _180 = _162 + _178;
        float _182 = _174 * _174;
        float _184 = _170 * _176;
        float _186 = -_180;
        float _188 = _186 + 1.0;
        float _190 = _174 * _182;
        float _192 = -_180;
        float _194 = _192 + 2.0;
        float _196 = -_170;
        float _198 = _196 + 2.0;
        float _200 = _188 * _188;
        float _202 = _190 * 4.0;
        float _204 = _194 * _194;
        float _206 = _198 * _198;
        float _208 = _188 * _200;
        float _210 = _166 + (-0.5);
        float _212 = _166 + 1.5;
        float _214 = -_202;
        float _216 = fma(_198, _206, _214);
        float _218 = _208 * 4.0;
        float _220 = -_208;
        float _222 = _220 + 6.0;
        float _224 = -_190;
        float _226 = _224 + 6.0;
        float _228 = 1.0 / _158;
        float _230 = -_218;
        float _232 = fma(_194, _204, _230);
        float _234 = _190 + _216;
        float _236 = -_216;
        float _238 = _236 + _226;
        float _240 = _216 * 0.16666667163372039794921875;
        float _242 = -_232;
        float _244 = _242 + _222;
        float _246 = _208 + _232;
        float _248 = _234 * 0.16666667163372039794921875;
        float _250 = _238 * 0.16666667163372039794921875;
        float _252 = _244 * 0.16666667163372039794921875;
        float _254 = _246 * 0.16666667163372039794921875;
        float _256 = 1.0 / _248;
        float _258 = _164 + 1.5;
        float _260 = _232 * 0.16666667163372039794921875;
        float _262 = _184 * 0.16666667163372039794921875;
        float _264 = 1.0 / _254;
        float _266 = 1.0 / _252;
        float _268 = 1.0 / _250;
        float _270 = fma(_260, _264, _210);
        float _272 = _270 * _228;
        float _274 = 1.0 / _156;
        float _276 = _164 + (-0.5);
        float _278 = fma(_240, _256, _276);
        float _280 = fma(_262, _268, _258);
        float _282 = _180 * _180;
        float _284 = _180 * _282;
        float _286 = _284 * 0.16666667163372039794921875;
        float _288 = fma(_286, _266, _212);
        float _290 = _278 * _274;
        float _292 = _280 * _274;
        float _294 = _288 * _228;
        float2 _767 = float2(_272, _290);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_767, float2(0.0), isnan(_767)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_767, float2(0.0), isnan(_767)), level(_134)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _782 = float2(_294, _290);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_782, float2(0.0), isnan(_782)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_782, float2(0.0), isnan(_782)), level(_134)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _797 = float2(_272, _292);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_797, float2(0.0), isnan(_797)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_797, float2(0.0), isnan(_797)), level(_134)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float2 _812 = float2(_294, _292);
        float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_812, float2(0.0), isnan(_812)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_812, float2(0.0), isnan(_812)), level(_134)).xyz;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float _330 = 0.0 + _132;
        float _332 = precise::clamp(_330, 0.0, 1.0);
        float _334 = fma(_88, _332, _86);
        float _336 = _332 * _88;
        float _338 = -_312;
        float _340 = _304 + _338;
        float _342 = -_308;
        float _344 = _300 + _342;
        float _346 = -_310;
        float _348 = _302 + _346;
        float _350 = -_328;
        float _352 = _320 + _350;
        float _354 = -_324;
        float _356 = _316 + _354;
        float _358 = fma(_254, _340, _312);
        float _360 = -_326;
        float _362 = _318 + _360;
        float _364 = fma(_254, _352, _328);
        float _366 = fma(_254, _344, _308);
        float _368 = fma(_254, _356, _324);
        float _370 = 1.0 / _334;
        float _372 = fma(_254, _348, _310);
        float _374 = fma(_254, _362, _326);
        float _376 = -_364;
        float _378 = _376 + _358;
        float _380 = -_368;
        float _382 = _380 + _366;
        float _384 = -_374;
        float _386 = _384 + _372;
        float _388 = fma(_248, _378, _364);
        float _390 = fma(_248, _382, _368);
        float _392 = fma(_248, _386, _374);
        float _394 = -_388;
        float _396 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[13].z, _394);
        float _398 = -_390;
        float _400 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[13].x, _398);
        float _402 = -_392;
        float _404 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[13].y, _402);
        float _406 = fma(_112, _396, _388);
        float _408 = fma(_112, _400, _390);
        float _410 = _370 * _336;
        float _412 = fma(_112, _404, _392);
        float _414 = _406 * _336;
        float _416 = _408 * _410;
        float _418 = _412 * _410;
        float _420 = _414 * _370;
        out.m_36.x = _416;
        out.m_36.y = _418;
        out.m_36.z = _420;
        out.m_36.w = _334;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _86;
    return out;
}

