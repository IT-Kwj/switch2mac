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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _960, thread const int& _961, constant _10& support_buffer)
{
    int _964 = 1 + _961;
    float _966 = support_buffer._m5[_964].x;
    float _968 = abs(_966);
    bool _970 = _968 == 1.0;
    if (_970)
    {
        return _960;
    }
    float _972 = float(_960);
    float _974 = _972 / _968;
    int _976 = int(_974);
    return _976;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _438 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_438, float2(0.0), isnan(_438))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_438, float2(0.0), isnan(_438))).x;
    float _66 = -_64;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = 1.0 / _68;
    bool _74 = _70 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_74)
    {
        discard_fragment();
    }
    if (_74)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _76 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _86 = precise::clamp(_84, 0.0, 1.0);
    bool _88 = _78 != 0.0;
    bool _90 = isnan(_78);
    bool _92 = _88 || _90;
    bool _94 = isnan(0.0);
    bool _96 = _92 || _94;
    bool _98 = !_96;
    if (!_98)
    {
        float _100 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _102 = fma(_78, _100, 1.0);
        float _104 = log2(_102);
        float _106 = _104 + (-1.0);
        float _108 = trunc(_106);
        int _110 = int(_108);
        int _112 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_110), spvDescriptorSet0.fp_t_tcb_A.get_height(_110)).x;
        int _114 = _112;
        int _116 = 1;
        int _118 = _40(_114, _116, (*spvDescriptorSet0.support_buffer));
        int _120 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_110), spvDescriptorSet0.fp_t_tcb_A.get_height(_110)).y;
        int _122 = _120;
        int _124 = 1;
        int _126 = _40(_122, _124, (*spvDescriptorSet0.support_buffer));
        float _128 = float(_118);
        float _130 = float(_126);
        float _132 = fma(_60, _128, -0.5);
        float _134 = fma(_62, _130, -0.5);
        float _136 = floor(_132);
        float _138 = floor(_134);
        float _140 = -_136;
        float _142 = _132 + _140;
        float _144 = -_142;
        float _146 = _144 + 1.0;
        float _148 = -_142;
        float _150 = _148 + 2.0;
        float _152 = -_138;
        float _154 = _134 + _152;
        float _156 = _146 * _146;
        float _158 = -_154;
        float _160 = _158 + 1.0;
        float _162 = _146 * _156;
        float _164 = -_154;
        float _166 = _164 + 2.0;
        float _168 = _150 * _150;
        float _170 = _160 * _160;
        float _172 = -_162;
        float _174 = _172 + 6.0;
        float _176 = _166 * _166;
        float _178 = _160 * _170;
        float _180 = _162 * 4.0;
        float _182 = _178 * 4.0;
        float _184 = -_180;
        float _186 = fma(_150, _168, _184);
        float _188 = _142 * _142;
        float _190 = 1.0 / _130;
        float _192 = -_182;
        float _194 = fma(_166, _176, _192);
        float _196 = -_186;
        float _198 = _196 + _174;
        float _200 = -_178;
        float _202 = _200 + 6.0;
        float _204 = _142 * _188;
        float _206 = _178 + _194;
        float _208 = _198 * 0.16666667163372039794921875;
        float _210 = -_194;
        float _212 = _210 + _202;
        float _214 = _194 * 0.16666667163372039794921875;
        float _216 = _206 * 0.16666667163372039794921875;
        float _218 = 1.0 / _208;
        float _220 = _212 * 0.16666667163372039794921875;
        float _222 = _162 + _186;
        float _224 = _154 * _154;
        float _226 = _136 + (-0.5);
        float _228 = _186 * 0.16666667163372039794921875;
        float _230 = _222 * 0.16666667163372039794921875;
        float _232 = _154 * _224;
        float _234 = 1.0 / _216;
        float _236 = _136 + 1.5;
        float _238 = _204 * 0.16666667163372039794921875;
        float _240 = _232 * 0.16666667163372039794921875;
        float _242 = 1.0 / _230;
        float _244 = fma(_238, _218, _236);
        float _246 = 1.0 / _220;
        float _248 = 1.0 / _128;
        float _250 = _138 + (-0.5);
        float _252 = _138 + 1.5;
        float _254 = fma(_228, _242, _226);
        float _256 = fma(_214, _234, _250);
        float _258 = fma(_240, _246, _252);
        float _260 = _256 * _190;
        float _262 = _254 * _248;
        float _264 = _244 * _248;
        float _266 = _258 * _190;
        float2 _730 = float2(_262, _260);
        float3 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_730, float2(0.0), isnan(_730)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_730, float2(0.0), isnan(_730)), level(_106)).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        float2 _745 = float2(_264, _260);
        float3 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_745, float2(0.0), isnan(_745)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_745, float2(0.0), isnan(_745)), level(_106)).xyz;
        float _280 = _278.x;
        float _282 = _278.y;
        float _284 = _278.z;
        float2 _760 = float2(_262, _266);
        float3 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_760, float2(0.0), isnan(_760)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_760, float2(0.0), isnan(_760)), level(_106)).xyz;
        float _288 = _286.x;
        float _290 = _286.y;
        float _292 = _286.z;
        float2 _775 = float2(_264, _266);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_775, float2(0.0), isnan(_775)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_775, float2(0.0), isnan(_775)), level(_106)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float _302 = precise::min(_82, _86);
        float _304 = 0.0 + _104;
        float _306 = precise::clamp(_304, 0.0, 1.0);
        float _308 = -_280;
        float _310 = _272 + _308;
        float _312 = -_282;
        float _314 = _274 + _312;
        float _316 = -_284;
        float _318 = _276 + _316;
        float _320 = fma(_230, _310, _280);
        float _322 = -_298;
        float _324 = _290 + _322;
        float _326 = -_296;
        float _328 = _288 + _326;
        float _330 = fma(_230, _314, _282);
        float _332 = -_300;
        float _334 = _292 + _332;
        float _336 = fma(_230, _324, _298);
        float _338 = fma(_230, _328, _296);
        float _340 = fma(_230, _318, _284);
        float _342 = fma(_230, _334, _300);
        float _344 = -_336;
        float _346 = _344 + _330;
        float _348 = -_338;
        float _350 = _348 + _320;
        float _352 = -_342;
        float _354 = _352 + _340;
        float _356 = fma(_216, _346, _336);
        float _358 = fma(_216, _350, _338);
        float _360 = _302 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _362 = fma(_216, _354, _342);
        float _364 = _356 * 0.586600005626678466796875;
        float _366 = fma(_358, 0.29890000820159912109375, _364);
        float _368 = fma(_362, 0.1143999993801116943359375, _366);
        float _370 = -_358;
        float _372 = _370 + _368;
        float _374 = -_356;
        float _376 = _374 + _368;
        float _378 = -_362;
        float _380 = _378 + _368;
        float _382 = fma(_360, _372, _358);
        float _384 = fma(_360, _376, _356);
        float _386 = fma(_360, _380, _362);
        float _388 = -_382;
        float _390 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[13].x, _388);
        float _392 = -_384;
        float _394 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[13].y, _392);
        float _396 = -_386;
        float _398 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[13].z, _396);
        float _400 = fma(_302, _390, _382);
        float _402 = fma(_302, _394, _384);
        float _404 = fma(_302, _398, _386);
        out.m_34.x = _400;
        out.m_34.y = _402;
        out.m_34.z = _404;
        out.m_34.w = _306;
        return out;
    }
    discard_fragment();
    return out;
}

