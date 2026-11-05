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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
};

static inline __attribute__((always_inline))
int _92(thread const int& _7705, thread const int& _7706, constant _10& support_buffer)
{
    float _7709 = as_type<float>(support_buffer._m4);
    int _7711 = _7706 + as_type<int>(_7709);
    int _7713 = 1 + _7711;
    float _7715 = support_buffer._m5[_7713].x;
    float _7717 = abs(_7715);
    bool _7719 = _7717 == 1.0;
    if (_7719)
    {
        return _7705;
    }
    float _7721 = float(_7705);
    float _7723 = _7721 / _7717;
    int _7725 = int(_7723);
    return _7725;
}

static inline __attribute__((always_inline))
int _93(thread const int& _7755, thread const int& _7756, constant _10& support_buffer)
{
    float _7759 = as_type<float>(support_buffer._m4);
    int _7761 = _7756 + as_type<int>(_7759);
    int _7763 = 1 + _7761;
    float _7765 = support_buffer._m5[_7763].x;
    bool _7767 = _7765 == 1.0;
    if (_7767)
    {
        return _7755;
    }
    float _7769 = float(_7755);
    float _7771 = _7769 * _7765;
    int _7773 = int(_7771);
    return _7773;
}

static inline __attribute__((always_inline))
void _90(thread const int& _7389, thread const int& _7390, thread const int& _7391, thread const int& _7392, thread const int& _7393, thread int& _7394, thread int& _7395, thread int& _7396, thread int& _7397, thread int& _7398, thread int& _7399, thread int& _7400, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _7403 = _7393;
    int _7405 = _7390;
    int _7407 = _7392;
    float _7409 = 0.0 + as_type<float>(_7389);
    bool _7411 = _7409 != 0.0;
    bool _7413 = isnan(_7409);
    bool _7415 = _7411 || _7413;
    bool _7417 = isnan(0.0);
    bool _7419 = _7415 || _7417;
    int _7421 = as_type<int>(_7409);
    int _7423 = _7419 ? (-1) : 0;
    if (!_7419)
    {
        float _7425 = as_type<float>(_7389) * 1.0;
        _7403 = as_type<int>(_7425);
    }
    int _7427 = _7403;
    bool _7429 = !_7419;
    int _7431 = _7427;
    int _7433 = _7427;
    if (!_7429)
    {
        bool _7435 = _7409 >= 0.0;
        bool _7437 = isnan(_7409);
        bool _7439 = _7435 || _7437;
        bool _7441 = isnan(0.0);
        bool _7443 = _7439 || _7441;
        _7423 = _7443 ? (-1) : 0;
        if (!_7443)
        {
            _7431 = 2147483647;
        }
        int _7445 = _7431;
        bool _7447 = !_7443;
        int _7449 = _7445;
        _7433 = _7445;
        if (!_7447)
        {
            float _7451 = abs(as_type<float>(_7389));
            float _7453 = 0.0 + _7451;
            bool _7455 = _7453 > as_type<float>(0x7f800000u /* inf */);
            bool _7457 = isnan(_7453);
            bool _7459 = _7455 || _7457;
            bool _7461 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _7463 = _7459 || _7461;
            _7421 = as_type<int>(_7453);
            _7423 = _7463 ? (-1) : 0;
            if (_7463)
            {
                float _7465 = as_type<float>(_7389) + 1.0;
                _7449 = as_type<int>(_7465);
            }
            int _7467 = _7449;
            int _7469 = _7467;
            _7433 = _7467;
            if (!_7463)
            {
                bool _7471 = _7453 != as_type<float>(0x7f800000u /* inf */);
                bool _7473 = isnan(_7453);
                bool _7475 = _7471 || _7473;
                bool _7477 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _7479 = _7475 || _7477;
                _7423 = _7479 ? (-1) : 0;
                if (!_7479)
                {
                    _7469 = _7389;
                }
                int _7481 = _7469;
                bool _7483 = !_7479;
                _7433 = _7481;
                if (!_7483)
                {
                    float _7485 = as_type<float>(_7389) * 18446744073709551616.0;
                    float _7487 = rsqrt(_7485);
                    float _7489 = _7485 * _7487;
                    float _7491 = _7487 * 0.5;
                    float _7493 = -_7489;
                    float _7495 = 0.0 + _7493;
                    float _7497 = fma(_7491, _7495, 0.5);
                    float _7499 = fma(_7489, _7497, _7489);
                    float _7501 = -_7499;
                    float _7503 = 0.0 + _7501;
                    float _7505 = fma(_7499, _7503, _7485);
                    float _7507 = fma(_7491, _7505, _7499);
                    float _7509 = _7507 * 2.3283064365386962890625e-10;
                    _7421 = as_type<int>(_7507);
                    _7405 = as_type<int>(_7499);
                    _7407 = as_type<int>(_7495);
                    _7433 = as_type<int>(_7509);
                }
            }
        }
    }
    int _7511 = _7421;
    int _7513 = _7405;
    int _7515 = _7407;
    int _7517 = _7433;
    int _7519 = _7423;
    _7394 = _7391;
    _7395 = 0;
    _7396 = _7511;
    _7397 = _7513;
    _7398 = _7515;
    _7399 = _7517;
    _7400 = _7519;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1837 = false;
    bool _1645 = false;
    bool _668 = false;
    bool _527 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _101 = int(_99);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3048 = as_type<float>(_117);
        out.gl_Position.z = _3048;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_49.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = _135;
    if (_131)
    {
        float _139 = float(_101);
        _111 = _139;
    }
    float _141 = _111;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    float _149 = _141;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _149;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3118 = as_type<float>(_155);
        out.gl_Position.z = _3118;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = in.m_51.x;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = in.m_53.y;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _161 * _159;
    float _183 = 0.0;
    if (!_175)
    {
        float _185 = _165 * _165;
        float _187 = _185 * 0.5;
        _183 = _187;
    }
    float _189 = _183;
    float _191 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _193 = _189;
    if (!_175)
    {
        float _195 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = in.m_49.x;
    float _201 = in.m_49.y;
    float _203 = in.m_49.z;
    float _205 = _191 * 6.283185482025146484375;
    float _207 = floor(_191);
    float _209 = _205 * 0.15915493667125701904296875;
    float _211 = _209 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = -_207;
    float _217 = _191 + _215;
    float _219 = _207;
    float _221 = _197;
    if (!_175)
    {
        _219 = _165;
    }
    float _223 = _219;
    bool _225 = !_175;
    float _227 = _223;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _165 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _165);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _257;
    }
    float _259 = _221;
    bool _261 = !_175;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _165 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _227 = _281;
    }
    float _283 = _227;
    float _285 = in.m_55.w;
    float _287 = in.m_44.x;
    float _289 = in.m_44.y;
    float _291 = in.m_44.z;
    bool _293 = _217 < 0.5;
    float _295 = float(_293);
    float _297 = -_217;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _303 = _301 != 0;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _307 = _305 != 0;
    float _309 = fma(_213, 0.5, 0.5);
    float _311 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_57.y = _163;
    bool _317 = !_303;
    int _319 = _317 ? 0 : 1;
    float _321 = -_309;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = fma(_283, _199, _311);
    bool _327 = !_307;
    int _329 = _327 ? 0 : 1;
    float _331 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _333 = !_179;
    int _335 = _333 ? 0 : 1;
    float _337 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _339 = abs(_319);
    float _341 = fma(_283, _201, _331);
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_283, _203, _337);
    int _347 = abs(_329);
    int _349 = abs(_335);
    float _351 = float(_339);
    float _353 = fma(_325, _285, _287);
    float _355 = float(_349);
    float _357 = fma(_341, _285, _289);
    float _359 = float(_347);
    float _361 = abs(_299);
    float _363 = _351 * _361;
    float _365 = fma(_345, _285, _291);
    float _367 = fma(_355, _323, _363);
    float _369 = abs(_315);
    float _371 = fma(_359, _369, _367);
    bool _373 = !_343;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_101);
        float _395 = 1.0 / _393;
        float _397 = _135 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = in.m_55.x;
    float _407 = in.m_55.y;
    float _409 = in.m_55.z;
    bool _411 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_399);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _423;
    bool _427 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_399);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _441 = 1.0 / _425;
    float _443 = -_437;
    float _445 = _443 + 1.0;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _403 * _441;
    float _455 = fma(_451, _453, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _461;
    float _465 = _439 * _157;
    float _467 = _421 * _445;
    float _469 = fma(_459, _453, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = fma(_463, _453, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _473 = -_421;
    float _475 = _473 + 1.0;
    float _477 = _455 * _467;
    float _479 = trunc(_465);
    int _481 = int(_479);
    float _483 = _469 * _467;
    float _485 = _471 * _467;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _477);
    float _489 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].z, _485);
    float _493 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].x, _487);
    float _495 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].y, _489);
    float _497 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].z, _491);
    float _499 = _493 * _405;
    float _501 = _495 * _407;
    float _503 = _497 * _409;
    int _505 = _481 << 4;
    int _507 = _505 + 1712;
    bool _509 = !_447;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_101);
        float _531 = 1.0 / _529;
        float _533 = _135 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    uint _538 = uint(int(uint(_507) >> uint(2)));
    uint _540 = uint(int(uint(int(_538)) >> uint(2)));
    int _542 = int(_538) & 3;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[int(_540)][_542];
    int _546 = int(_538) + 1;
    uint _548 = uint(int(uint(_546) >> uint(2)));
    int _550 = _546 & 3;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[int(_548)][_550];
    bool _554 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_535);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _572 = _507 + 8;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    uint _576 = uint(int(uint(int(_574)) >> uint(2)));
    int _578 = int(_574) & 3;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[int(_576)][_578];
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = 1.0 / _568;
    float _588 = -_564;
    float _590 = _588 + 1.0;
    float _592 = _570 * _157;
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _596 = _584 * _586;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _535 + _598;
    bool _602 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _604 = isnan(_535);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_596, _600, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _616 = _612 * _590;
    float _618 = -_612;
    float _620 = _618 + 1.0;
    float _622 = trunc(_592);
    int _624 = int(_622);
    float _626 = _614 * _616;
    float _628 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _626);
    float _630 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[116].x, _628);
    float _632 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _634 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _636 = _630 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _638 = _624 << 4;
    int _640 = _638 + 1968;
    float _642 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _650 = !_594;
    float _666;
    if (!_650)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _654 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_101);
        float _672 = 1.0 / _670;
        float _674 = _135 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    int _678 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _680 = _678;
    int _682 = 0;
    int _684 = _92(_680, _682, (*spvDescriptorSet0.support_buffer));
    float _686 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _688 = int(_686);
    float _690 = fma(_135, 0.01200000010430812835693359375, _157);
    float _692 = in.m_53.z;
    float _694 = in.m_51.y;
    float _696 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _698 = int(_696);
    float _700 = float(_688);
    float _702 = floor(_690);
    float _704 = float(uint(_698));
    float _706 = 1.0 / _700;
    float _708 = 1.0 / _704;
    float _710 = _135 * _706;
    float _712 = trunc(_692);
    int _714 = int(_712);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _718 = _716 != 0;
    int _720 = as_type<int>(_708) + (-2);
    float _722 = trunc(_710);
    int _724 = int(_722);
    int _726 = ~_698;
    int _728 = _726 + 1;
    float _730 = float(uint(_724));
    float _732 = as_type<float>(_720) * _730;
    float _734 = fma(_702, 0.20000000298023223876953125, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = trunc(_732);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    int _744 = _728 * int(_742);
    int _746 = _744 + _724;
    float _748 = float(uint(_746));
    float _750 = as_type<float>(_720) * _748;
    float _752 = _694 * 1.2345600128173828125;
    bool _754 = !_718;
    float _756 = _754 ? _752 : _157;
    float _758 = trunc(_750);
    float _760 = precise::max(_758, 0.0);
    uint _762 = uint(_760);
    int _764 = _684 + (-1);
    float _766 = float(_764);
    float _768 = _736 * _766;
    float _770 = trunc(_768);
    int _772 = int(_770);
    int _774 = _772;
    int _776 = 0;
    int _778 = _93(_774, _776, (*spvDescriptorSet0.support_buffer));
    int _780 = _714;
    int _782 = 0;
    int _784 = _93(_780, _782, (*spvDescriptorSet0.support_buffer));
    float4 _787 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_778, _784)), 0).xyzw;
    float _789 = _787.x;
    float _791 = _787.y;
    float _793 = _787.z;
    float _795 = _787.w;
    int _797 = ~_698;
    int _799 = _797 + 1;
    float _801 = floor(_756);
    int _803 = int(_742) + int(_762);
    float _805 = float(_698);
    float _807 = float(_724);
    int _809 = _799 * _803;
    int _811 = _809 + _724;
    float _813 = float(_101);
    bool _815 = _807 >= _805;
    bool _817 = isnan(_807);
    bool _819 = _815 || _817;
    bool _821 = isnan(_805);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    bool _827 = uint(_811) >= uint(_698);
    float _829 = 1.0 / _813;
    bool _831 = _698 == 0;
    bool _833 = !_827;
    int _835 = _833 ? 0 : (-1);
    float _837 = -_801;
    float _839 = _756 + _837;
    int _841 = ~_803;
    int _843 = _841 + _835;
    int _845 = _843 + 1;
    float _847 = trunc(_825);
    int _849 = int(_847);
    float _851 = _839 * _805;
    float _853 = _135 * _805;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _865 = _863 != 0;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _869 = _867 != 0;
    int _871 = _698 * _845;
    int _873 = _871 + _724;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _877 = _875 != 0;
    int _879 = _698 + (-1);
    float _881 = _853 * _829;
    bool _883 = !_831;
    int _885 = _883 ? _873 : (-1);
    float _887 = trunc(_851);
    int _889 = int(_887);
    bool _891 = !_861;
    int _893 = _891 ? 0 : 1;
    bool _895 = !_857;
    int _897 = _895 ? 0 : 1;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _901 = _899 != 0;
    int _903 = ~_849;
    int _905 = _903 + 1;
    int _907 = _905 + 1;
    float _909 = trunc(_881);
    int _911 = int(_909);
    int _913 = ~_698;
    int _915 = _913 + 1;
    int _917 = _885 * _907;
    bool _919 = !_877;
    int _921 = _919 ? 0 : 1;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    int _927 = _849 * _879;
    int _929 = _927 + _917;
    int _931 = abs(_893);
    int _933 = abs(_921);
    bool _935 = !_865;
    int _937 = _935 ? 0 : 1;
    int _939 = _929 * _931;
    int _941 = abs(_897);
    int _943 = _889 * _933;
    int _945 = _943 + _724;
    bool _947 = !_869;
    int _949 = _947 ? 0 : 1;
    float _951 = in.m_53.x;
    int _953 = abs(_937);
    int _955 = abs(_949);
    int _957 = _911 * _941;
    int _959 = _957 + _939;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _963 = _961 != 0;
    int _965 = _945 * _953;
    int _967 = _965 + _959;
    int _969 = ~_698;
    int _971 = _969 + 1;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _975 = _973 != 0;
    int _977 = _889 * _955;
    int _979 = _977 + _967;
    float _981 = float(uint(_945));
    float _983 = float(uint(_979));
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _987 = ~_698;
    int _989 = _987 + 1;
    float _991 = as_type<float>(_720) * _981;
    float _993 = as_type<float>(_720) * _983;
    int _995 = ~_698;
    int _997 = _995 + 1;
    float _999 = trunc(_991);
    float _1001 = precise::max(_999, 0.0);
    uint _1003 = uint(_1001);
    float _1005 = trunc(_993);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    int _1011 = _997 * int(_1009);
    int _1013 = _1011 + _979;
    float _1015 = float(uint(_1013));
    float _1017 = as_type<float>(_720) * _1015;
    float _1019 = in.m_51.w;
    float _1021 = trunc(_1017);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    float _1027 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1029 = int(_1009) + int(_1025);
    float _1031 = as_type<float>(_971);
    float _1033 = as_type<float>(_979);
    float _1035 = _951;
    if (_963)
    {
        float _1037 = in.m_51.z;
        _1031 = _1037;
    }
    float _1039 = _1031;
    bool _1041 = _1019 > 0.5;
    bool _1043 = _1041 && _901;
    int _1045 = _971 * _1029;
    int _1047 = _1045 + _979;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1053 = uint(_1047) >= uint(_698);
    float _1055 = 1.0 / _1051;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1059 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1061 = !_1053;
    int _1063 = _1061 ? 0 : (-1);
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1067 = _1065 != 0;
    float _1069 = fma(_1059, -2.0, _985);
    float _1071 = -_1057;
    float _1073 = fma(_1027, 2.0, _1071);
    int _1075 = ~_1029;
    int _1077 = _1075 + _1063;
    int _1079 = _1077 + 1;
    float _1081 = -_163;
    float _1083 = _1081 + 1.0;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1085;
    bool _1089 = _694 > 0.5;
    bool _1091 = _1089 && _1067;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1095 = _698 * _1079;
    int _1097 = _1095 + _979;
    float _1099 = _1087 * _1055;
    float _1101 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1069);
    float _1103 = _1043 ? _1083 : _163;
    float _1105 = -_135;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1073);
    float _1109 = _1091 ? _1083 : _163;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1113 = _1043;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    bool _1117 = _1091;
    float _1119 = _1109;
    if (_963)
    {
        bool _1121 = _1039 > 0.5;
        _1113 = _1121;
    }
    bool _1123 = _1113;
    float _1125 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1127 = _1039;
    if (!_718)
    {
        float _1129 = in.m_51.z;
        _1127 = _1129;
    }
    float _1131 = _1127;
    bool _1133 = !_831;
    int _1135 = _1133 ? _1097 : (-1);
    float _1137 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1111);
    if (!_718)
    {
        _1115 = _694;
    }
    float _1139 = _1115;
    float _1141 = _1139;
    if (_925)
    {
        bool _1143 = _157 > 0.5;
        _1117 = _1143;
    }
    bool _1145 = _1117;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (_718)
    {
        _1141 = _157;
    }
    float _1149 = _1141;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1153 = _676 + _1151;
    int _1155 = _1135 >> 31;
    if (!_925)
    {
        _1033 = _951;
    }
    float _1157 = _1033;
    float _1159 = fma(_1099, _1153, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1161 = _1155 & 3;
    float _1163 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1165 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1147);
    float _1167 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1169 = _1135 + _1161;
    float _1171 = fma(_1163, _1109, -0.5);
    float _1173 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1165);
    int _1175 = _915 * int(_1003);
    int _1177 = _1175 + _945;
    int _1179 = _1169 >> 2;
    int _1181 = as_type<int>(_1163);
    float _1183 = _1157;
    int _1185 = as_type<int>(_1167);
    if (_925)
    {
        float _1187 = -_951;
        float _1189 = _1187 + 1.0;
        _1181 = as_type<int>(_1189);
    }
    int _1191 = _1181;
    float _1193 = _1131;
    if (!_718)
    {
        _1119 = _1131;
    }
    float _1195 = _1119;
    int _1197 = _1179 << 4;
    int _1199 = _1197 + 512;
    float _1201 = float(uint(_1177));
    float _1203 = _1195;
    if (_925)
    {
        float _1205 = _1145 ? as_type<float>(_1191) : _951;
        _1183 = _1205;
    }
    float _1207 = _1183;
    if (_718)
    {
        _1203 = _694;
    }
    float _1209 = _1203;
    uint _1211 = uint(int(uint(_1199) >> uint(2)));
    uint _1213 = uint(int(uint(int(_1211)) >> uint(2)));
    int _1215 = int(_1211) & 3;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[int(_1213)][_1215];
    int _1219 = int(_1211) + 1;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    int _1223 = _1219 & 3;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[int(_1221)][_1223];
    if (_718)
    {
        _1193 = _694;
    }
    float _1227 = _1193;
    float _1229 = -_1101;
    float _1231 = fma(_1173, _1171, _1229);
    float _1233 = as_type<float>(_720) * _1201;
    bool _1235 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1237 = isnan(_676);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1243 = _1239 || _1241;
    float _1245 = float(_1243);
    float _1247 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1249 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1251 = isnan(_676);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = trunc(_1233);
    float _1263 = precise::max(_1261, 0.0);
    uint _1265 = uint(_1263);
    float _1267 = -_1245;
    float _1269 = _1267 + 1.0;
    int _1271 = _1135 & 3;
    bool _1273 = _1271 != 0;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1277 = _1259 * _1269;
    int _1279 = _1135 & 3;
    bool _1281 = _1279 != 0;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1285 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1275);
    int _1287 = _1273 ? 0 : 1;
    int _1289 = _1199 + 8;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    bool _1307 = uint(_1279) > 1u;
    float _1309 = _1159 * _1277;
    float _1311 = -_1283;
    float _1313 = fma(_1167, 2.0, _1311);
    if (_963)
    {
        float _1315 = -_951;
        float _1317 = _1315 + 1.0;
        _1185 = as_type<int>(_1317);
    }
    int _1319 = _1185;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1323 = int(_1003) + int(_1265);
    float _1325 = -_135;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1313);
    float _1329 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1321);
    if (_963)
    {
        float _1331 = _1123 ? as_type<float>(_1319) : _951;
        _1035 = _1331;
    }
    float _1333 = _1035;
    float _1335 = -_1259;
    float _1337 = _1335 + 1.0;
    bool _1339 = _1279 != 3;
    int _1341 = _989 * _1323;
    int _1343 = _1341 + _945;
    int _1345 = ~_1287;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    float _1351 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1309);
    int _1353 = _1349;
    if (!_1307)
    {
        int _1355 = ~_1287;
        int _1357 = _1355 + 1;
        _1353 = _1357;
    }
    int _1359 = _1353;
    float _1361 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _1363 = uint(_1279) >= 2u;
    float _1365 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1351);
    int _1367 = abs(_1359);
    bool _1369 = uint(_1343) >= uint(_698);
    int _1371 = _1363 ? 0 : 1;
    bool _1373 = !_1281;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = ~_1367;
    int _1379 = _1377 + 1;
    int _1381 = _1379 + 1;
    bool _1383 = !_1369;
    int _1385 = _1383 ? 0 : (-1);
    int _1387 = ~_1371;
    int _1389 = _1387 + 1;
    int _1391 = _1389 + 1;
    bool _1393 = _1279 != 3;
    int _1395 = _1391;
    if (_1339)
    {
        int _1397 = ~_1371;
        int _1399 = _1397 + 1;
        _1395 = _1399;
    }
    int _1401 = _1395;
    int _1403 = _1381 * as_type<int>(_1225);
    int _1405 = abs(_1375);
    float _1407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1409 = ~_1323;
    int _1411 = _1409 + _1385;
    int _1413 = _1411 + 1;
    bool _1415 = !_1393;
    int _1417 = _1415 ? 0 : (-1);
    int _1419 = abs(_1401);
    int _1421 = _698 * _1413;
    int _1423 = _1421 + _945;
    int _1425 = ~_1405;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    int _1431 = _640 + 8;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    uint _1435 = uint(int(uint(int(_1433)) >> uint(2)));
    int _1437 = int(_1433) & 3;
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[int(_1435)][_1437];
    bool _1441 = !_975;
    int _1443 = _1441 ? 0 : 1;
    int _1445 = abs(_1417);
    int _1447 = _1429 * as_type<int>(_1217);
    int _1449 = _1447 + _1403;
    int _1451 = abs(_1443);
    int _1453 = ~_1419;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1461 = ~_1445;
    int _1463 = _1461 + 1;
    int _1465 = _1463 + 1;
    int _1467 = _1457 * as_type<int>(_1297);
    int _1469 = _1467 + _1449;
    int _1471 = ~_1451;
    int _1473 = _1471 + 1;
    int _1475 = _1473 + 1;
    float _1477 = fma(_1247, -2.0, _1459);
    int _1479 = _1465 * as_type<int>(_1305);
    int _1481 = _1479 + _1469;
    float _1483 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1485 = !_831;
    int _1487 = _1485 ? _1423 : (-1);
    float _1489 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1285);
    int _1491 = _1481 * _1475;
    float _1493 = fma(_1483, _1207, -0.5);
    uint _1495 = as_type<uint>(half2(float2(_795, 0.0)));
    float _1497 = fma(_1489, _1361, _1327);
    int _1499 = _1487 * _1451;
    int _1501 = _1499 + _1491;
    float _1503 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1137);
    uint _1505 = extract_bits(_1495, 0u, 8u);
    int _1507 = int(_1505) & 255;
    uint _1509 = extract_bits(_1495, 8u, 8u);
    int _1511 = int(_1509) & 255;
    int _1513 = _1511 << 8;
    int _1515 = _1507 | _1513;
    float _1517 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1329);
    float _1519 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1477);
    float _1521 = float(_1501);
    float _1523 = fma(_1503, _1493, _1107);
    bool _1525 = _1515 >= 32768;
    uint _1527 = uint(int(uint(_640) >> uint(2)));
    uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
    int _1531 = int(_1527) & 3;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[int(_1529)][_1531];
    int _1535 = int(_1527) + 1;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    int _1539 = _1535 & 3;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[int(_1537)][_1539];
    int _1543 = _772 + 1;
    out.m_59.y = _1521;
    float _1545 = -_1519;
    float _1547 = fma(_1517, _1125, _1545);
    int _1549 = min(_764, _1543);
    int _1551 = _1515 + (-1024);
    float _1553 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1555 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1557 = _1547 + 0.5;
    int _1559 = _1551;
    if (_1525)
    {
        int _1561 = ~_1515;
        int _1563 = _1561 + 33792;
        int _1565 = _1563 + 1;
        _1559 = _1565;
    }
    int _1567 = _1559;
    float _1569 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1571 = _1567 + 30719;
    float _1573 = float(_1571);
    float _1575 = fma(_1573, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1577 = abs(_1575);
    float _1579 = -_1577;
    float _1581 = _1579 + 1.0;
    bool _1583 = _1575 < 0.0;
    float _1585 = float(_1583);
    int _1587 = as_type<int>(_1581) + (-218103808);
    bool _1589 = uint(_1587) >= 1920991232u;
    float _1591 = _1541 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1593 = _1533 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1595 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1597 = abs(_1575);
    float _1599 = fma(_1597, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1601 = _1231 + 0.5;
    float _1603 = _1523 + 0.5;
    float _1605 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1607 = abs(_1575);
    float _1609 = fma(_1607, _1599, -0.212114393711090087890625);
    float _1611 = _1497 + 0.5;
    float _1613 = abs(_1575);
    float _1615 = fma(_1613, _1609, 1.570728778839111328125);
    bool _1617 = !_1589;
    float _1643;
    if (!_1617)
    {
        int _1619 = as_type<int>(_1581);
        int _1621 = as_type<int>(_1207);
        int _1623 = 7712;
        int _1625 = as_type<int>(_1581);
        int _1627 = _1449;
        int _1629;
        int _1631;
        int _1633;
        int _1635;
        int _1637;
        int _1639;
        int _1641;
        _90(_1619, _1621, _1623, _1625, _1627, _1629, _1631, _1633, _1635, _1637, _1639, _1641, out.gl_Position, out.gl_PointSize);
        _1643 = as_type<float>(_1639);
        _1645 = true;
    }
    else
    {
        float _1647 = rsqrt(_1581);
        float _1649 = _1581 * _1647;
        float _1651 = _1647 * 0.5;
        float _1653 = -_1649;
        float _1655 = 0.0 + _1653;
        float _1657 = fma(_1651, _1655, 0.5);
        float _1659 = fma(_1649, _1657, _1649);
        float _1661 = -_1659;
        float _1663 = 0.0 + _1661;
        float _1665 = fma(_1659, _1663, _1581);
        float _1667 = fma(_1651, _1665, _1659);
        _1643 = _1667;
    }
    _1645 = false;
    float _1669 = _1643;
    int _1671 = _1549;
    int _1673 = 0;
    int _1675 = _93(_1671, _1673, (*spvDescriptorSet0.support_buffer));
    int _1677 = _714;
    int _1679 = 0;
    int _1681 = _93(_1677, _1679, (*spvDescriptorSet0.support_buffer));
    float4 _1683 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1675, _1681)), 0).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float _1693 = _1615 * _1669;
    float _1695 = _1585 * 2.0;
    float _1697 = _1573 * 3.883221149444580078125;
    float _1699 = floor(_768);
    float _1701 = -_1695;
    float _1703 = fma(_1693, _1701, _1693);
    float _1705 = _1697 * 0.15915493667125701904296875;
    float _1707 = fma(_1585, 3.1415927410125732421875, _1703);
    float _1709 = _1705 * 6.283185482025146484375;
    float _1711 = cos(_1709);
    float _1713 = _1707 * 0.15915493667125701904296875;
    float _1715 = _1713 * 6.283185482025146484375;
    float _1717 = sin(_1715);
    float _1719 = -_1699;
    float _1721 = _768 + _1719;
    float _1723 = _1705 * 6.283185482025146484375;
    float _1725 = sin(_1723);
    float _1727 = _1717 * _1711;
    float _1729 = _1717 * _1725;
    uint _1731 = as_type<uint>(half2(float2(_1691, 0.0)));
    float _1733 = -_789;
    float _1735 = _1733 + _1685;
    float _1737 = -_793;
    float _1739 = _1737 + _1689;
    uint _1741 = extract_bits(_1731, 0u, 8u);
    int _1743 = int(_1741) & 255;
    uint _1745 = extract_bits(_1731, 8u, 8u);
    int _1747 = int(_1745) & 255;
    int _1749 = _1747 << 8;
    int _1751 = _1743 | _1749;
    float _1753 = fma(_1721, _1735, _789);
    float _1755 = fma(_1721, _1739, _793);
    bool _1757 = _1751 >= 32768;
    int _1759 = _1751 + (-1024);
    int _1761 = _1759;
    if (_1757)
    {
        int _1763 = ~_1751;
        int _1765 = _1763 + 33792;
        int _1767 = _1765 + 1;
        _1761 = _1767;
    }
    int _1769 = _1761;
    int _1771 = _1769 + 30719;
    float _1773 = float(_1771);
    float _1775 = fma(_1773, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1777 = abs(_1775);
    float _1779 = -_1777;
    float _1781 = _1779 + 1.0;
    float _1783 = abs(_1775);
    float _1785 = fma(_1783, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1787 = _1775 < 0.0;
    float _1789 = float(_1787);
    int _1791 = as_type<int>(_1781) + (-218103808);
    float _1793 = abs(_1775);
    float _1795 = fma(_1793, _1785, -0.212114393711090087890625);
    bool _1797 = uint(_1791) >= 1920991232u;
    float _1799 = -_791;
    float _1801 = _1799 + _1687;
    float _1803 = abs(_1775);
    float _1805 = fma(_1803, _1795, 1.570728778839111328125);
    float _1807 = fma(_1721, _1801, _791);
    bool _1809 = !_1797;
    float _1835;
    if (!_1809)
    {
        int _1811 = as_type<int>(_1781);
        int _1813 = as_type<int>(_1687);
        int _1815 = 8608;
        int _1817 = as_type<int>(_1699);
        int _1819 = as_type<int>(_1669);
        int _1821;
        int _1823;
        int _1825;
        int _1827;
        int _1829;
        int _1831;
        int _1833;
        _90(_1811, _1813, _1815, _1817, _1819, _1821, _1823, _1825, _1827, _1829, _1831, _1833, out.gl_Position, out.gl_PointSize);
        _1835 = as_type<float>(_1831);
        _1837 = true;
    }
    else
    {
        float _1839 = rsqrt(_1781);
        float _1841 = _1781 * _1839;
        float _1843 = _1839 * 0.5;
        float _1845 = -_1841;
        float _1847 = 0.0 + _1845;
        float _1849 = fma(_1843, _1847, 0.5);
        float _1851 = fma(_1841, _1849, _1841);
        float _1853 = -_1851;
        float _1855 = 0.0 + _1853;
        float _1857 = fma(_1851, _1855, _1781);
        float _1859 = fma(_1843, _1857, _1851);
        _1835 = _1859;
    }
    _1837 = false;
    float _1861 = _1835;
    float _1863 = in.m_51.x;
    float _1865 = in.m_51.y;
    float _1867 = in.m_51.z;
    float _1869 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1871 = log2(_1869);
    float _1873 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1875 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1877 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1879 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1873);
    float _1881 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1875);
    float _1883 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1877);
    float _1885 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1879);
    float _1887 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1881);
    float _1889 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1883);
    float _1891 = _1885 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1893 = _1887 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1895 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1897 = _1871 * _135;
    float _1899 = _1889 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1903 = _1893 + _1901;
    float _1905 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1907 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1909 = exp2(_1897);
    float _1911 = _1863 * 2.0;
    float _1913 = _1867 * 2.0;
    float _1915 = _1865 * 2.0;
    float _1917 = floor(_1911);
    float _1919 = floor(_1913);
    float _1921 = floor(_1915);
    bool _1923 = _1917 > 0.0;
    bool _1925 = _1917 >= 0.0;
    bool _1927 = isnan(_1917);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(0.0);
    bool _1933 = _1929 || _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1937 = _1891 + _1935;
    int _1939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1941 = _1939 != 0;
    int _1943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1945 = _1943 != 0;
    int _1947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1949 = _1947 != 0;
    float _1951 = _1937 * _1937;
    bool _1953 = _1919 >= 0.0;
    bool _1955 = isnan(_1919);
    bool _1957 = _1953 || _1955;
    bool _1959 = isnan(0.0);
    bool _1961 = _1957 || _1959;
    float _1963 = _1865 + _1867;
    int _1965 = _1933 ? 0 : 1;
    float _1967 = fma(_1903, _1903, _1951);
    int _1969 = _1961 ? 0 : 1;
    float _1971 = _1963 + (-1.0);
    bool _1973 = _1919 > 0.0;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1977 = _1899 + _1975;
    bool _1979 = _1921 > 0.0;
    bool _1981 = _1921 >= 0.0;
    bool _1983 = isnan(_1921);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(0.0);
    bool _1989 = _1985 || _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1993 = 1.0 + _1991;
    int _1995 = ~_1965;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    float _2001 = fma(_1977, _1977, _1967);
    int _2003 = _1999;
    if (!_1923)
    {
        int _2005 = ~_1965;
        int _2007 = _2005 + 1;
        _2003 = _2007;
    }
    int _2009 = _2003;
    float _2011 = in.m_61.x;
    float _2013 = in.m_61.y;
    float _2015 = in.m_61.z;
    float _2017 = 1.0 / _1993;
    bool _2019 = !_1945;
    int _2021 = _2019 ? 0 : 1;
    bool _2023 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2025 = isnan(1.0);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2031 = _2027 || _2029;
    int _2033 = abs(_2021);
    float _2035 = -_1909;
    float _2037 = _2035 + 1.0;
    bool _2039 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2041 = isnan(0.0);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2047 = _2043 || _2045;
    float _2049 = rsqrt(_2001);
    float _2051 = float(_2033);
    float _2053 = _2047 ? _2037 : 0.0;
    float _2055 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2057 = float(_2009);
    int _2059 = ~_1969;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    int _2065 = _2063;
    if (_2031)
    {
        float _2067 = _2053 * _2017;
        _137 = _2067;
    }
    float _2069 = _137;
    bool _2071 = !_1941;
    int _2073 = _2071 ? 0 : 1;
    float _2075 = _2051 * _2057;
    if (!_1973)
    {
        int _2077 = ~_1969;
        int _2079 = _2077 + 1;
        _2065 = _2079;
    }
    int _2081 = _2065;
    int _2083 = abs(_2073);
    float _2085 = _2075 * (-2.0);
    int _2087 = _1989 ? 0 : 1;
    float _2089 = _1937 * _2049;
    float _2091 = _1903 * _2049;
    float _2093 = fma(_2055, _2085, _2055);
    float _2095 = fma(_2085, _2013, _2013);
    float _2097 = -_2089;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1937);
    float _2101 = -_2091;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1903);
    float _2105 = _1865 + (-0.5);
    float _2107 = float(_2083);
    float _2109 = _2099 * _2099;
    float _2111 = float(_2081);
    float _2113 = _1977 * _2049;
    float _2115 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2095);
    float _2117 = fma(_2103, _2103, _2109);
    bool _2119 = !_1949;
    int _2121 = _2119 ? 0 : 1;
    float _2123 = _2107 * _2111;
    int _2125 = ~_2087;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    float _2131 = -_2113;
    float _2133 = fma(_2131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1977);
    int _2135 = _2129;
    if (!_1979)
    {
        int _2137 = ~_2087;
        int _2139 = _2137 + 1;
        _2135 = _2139;
    }
    int _2141 = _2135;
    float _2143 = _1865 + _1863;
    int _2145 = abs(_2121);
    float _2147 = _1863 + _1867;
    float _2149 = float(_2141);
    float _2151 = fma(_2133, _2133, _2117);
    float _2153 = float(_2145);
    float _2155 = _2147 + (-1.0);
    float _2157 = _2143 + (-1.0);
    float _2159 = fma(_2093, _2069, _2115);
    float _2161 = _2153 * _2149;
    float _2163 = fma(_2157, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2165 = _2123 * (-2.0);
    float _2167 = _2161 * (-2.0);
    float _2169 = _2159 * 0.15915493667125701904296875;
    float _2171 = fma(_2155, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2173 = fma(_2165, _2011, _2011);
    float _2175 = fma(_2163, _2165, _2163);
    float _2177 = _1863 + (-0.5);
    float _2179 = _1867 + (-0.5);
    float _2181 = fma(_2167, _2015, _2015);
    float _2183 = fma(_2171, _2167, _2171);
    float _2185 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2173);
    float _2187 = sqrt(_2151);
    float _2189 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2181);
    float _2191 = fma(_2175, _2069, _2185);
    float _2193 = fma(_2183, _2069, _2189);
    float _2195 = _2191 * 0.15915493667125701904296875;
    float _2197 = _2169 * 6.283185482025146484375;
    float _2199 = sin(_2197);
    float _2201 = _2193 * 0.15915493667125701904296875;
    float _2203 = _2169 * 6.283185482025146484375;
    float _2205 = cos(_2203);
    float _2207 = _2049 * _2187;
    float _2209 = _1895 * _2207;
    float _2211 = _1905 * _2207;
    float _2213 = _1907 * _2207;
    float _2215 = _2195 * 6.283185482025146484375;
    float _2217 = sin(_2215);
    float _2219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1755);
    float _2221 = _2213 * _2219;
    float _2223 = _2201 * 6.283185482025146484375;
    float _2225 = cos(_2223);
    float _2227 = _2195 * 6.283185482025146484375;
    float _2229 = cos(_2227);
    float _2231 = _2217 * _2199;
    float _2233 = _2217 * _2205;
    float _2235 = _2201 * 6.283185482025146484375;
    float _2237 = sin(_2235);
    float _2239 = _2217 * _2225;
    float _2241 = _2205 * _2225;
    float _2243 = _2229 * _2205;
    float _2245 = _2229 * _2199;
    float _2247 = _2229 * _2225;
    float _2249 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1807);
    float _2251 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1753);
    float _2253 = _2199 * _2225;
    float _2255 = _2209 * _2249;
    float _2257 = _2211 * _2251;
    float _2259 = fma(_2237, _2243, _2231);
    float _2261 = -_2233;
    float _2263 = fma(_2237, _2245, _2261);
    float _2265 = _2247 * _2255;
    float _2267 = -_2255;
    float _2269 = _2237 * _2267;
    float _2271 = -_2245;
    float _2273 = fma(_2237, _2233, _2271);
    float _2275 = _2239 * _2255;
    float _2277 = fma(_2259, _2257, _2265);
    float _2279 = fma(_2241, _2257, _2269);
    float _2281 = fma(_2237, _2231, _2243);
    float _2283 = fma(_2273, _2257, _2275);
    float _2285 = fma(_2263, _2221, _2277);
    float _2287 = fma(_2253, _2221, _2279);
    float _2289 = fma(_2281, _2221, _2283);
    float _2291 = _2285 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2293 = _2285 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2295 = _2285 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2297 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2291);
    float _2299 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2293);
    float _2301 = _702 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2303 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2295);
    float _2305 = fma(_2289, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2297);
    float _2307 = fma(_2289, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2299);
    float _2309 = fma(_2289, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2303);
    float _2311 = _1899 + _2305;
    float _2313 = _1893 + _2307;
    float _2315 = _1891 + _2309;
    float _2317 = fma(_2301, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2311);
    float _2319 = fma(_2301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2313);
    float _2321 = fma(_2301, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2315);
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2325 = _2317 + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2329 = _2319 + _2327;
    float _2331 = _2325 * _2325;
    float _2333 = fma(_2329, _2329, _2331);
    float _2335 = sqrt(_2333);
    bool _2337 = _2335 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2339 = _2295;
    float _2341 = _2315;
    float _2343 = _2321;
    float _2345 = 0.5;
    float _2347 = _2247;
    if (!_2337)
    {
        _2339 = _2319;
    }
    float _2349 = _2339;
    float _2351 = _2349;
    if (!_2337)
    {
        _2341 = _2317;
    }
    float _2353 = _2341;
    bool _2355 = !_2337;
    float _2357 = _2353;
    if (!_2355)
    {
        float _2359 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2363 = _2335 + _2361;
        float _2365 = rsqrt(_2333);
        float _2367 = _2363 * _2359;
        float _2369 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2371 = _2367 * 0.15915493667125701904296875;
        float _2373 = _2371 * 6.283185482025146484375;
        float _2375 = cos(_2373);
        float _2377 = _2371 * 6.283185482025146484375;
        float _2379 = sin(_2377);
        float _2381 = _2375 + (-1.0);
        float _2383 = fma(_2379, _2369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2385 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2387 = _2365 * _2383;
        float _2389 = fma(_2321, _2375, _2385);
        float _2391 = fma(_2329, _2387, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2393 = fma(_2325, _2387, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2343 = _2389;
        _2351 = _2391;
        _2357 = _2393;
    }
    float _2395 = _2343;
    float _2397 = _2351;
    float _2399 = _2357;
    float _2401 = -_2089;
    float _2403 = fma(_2401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2395);
    float _2405 = -_2091;
    float _2407 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2397);
    float _2409 = -_2113;
    float _2411 = fma(_2409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2399);
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2415 = _2403 + _2413;
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2419 = _2407 + _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2423 = _2411 + _2421;
    float _2425 = _2415 * _2415;
    float _2427 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2429 = fma(_2419, _2419, _2425);
    float _2431 = fma(_2423, _2423, _2429);
    float _2433 = rsqrt(_2431);
    float _2435 = sqrt(_2431);
    float _2437 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2439 = _2419 * _2437;
    float _2441 = _2423 * _2437;
    float _2443 = _2439 * _2439;
    float _2445 = _2441 * _2441;
    float _2447 = _2443 + _2445;
    float _2449 = sqrt(_2447);
    bool _2451 = _2449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2455 = _2449 + _2453;
    float _2457 = _2109;
    float _2459 = _2447;
    float _2461 = _2455;
    float _2463 = _2437;
    float _2465 = _2415;
    float _2467 = _2439;
    float _2469 = _2441;
    float _2471 = _2443;
    float _2473 = _2445;
    if (_2451)
    {
        float _2475 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2457 = _2475;
    }
    float _2477 = _2457;
    if (_2451)
    {
        float _2479 = rsqrt(_2447);
        _2459 = _2479;
    }
    float _2481 = _2459;
    if (_2451)
    {
        float _2483 = _2455 * _2477;
        _2461 = _2483;
    }
    float _2485 = _2461;
    float _2487 = precise::max(0.0, _2427);
    float _2489 = 0.0;
    float _2491 = _2487;
    if (_2451)
    {
        float _2493 = _2485 * 0.15915493667125701904296875;
        _2489 = _2493;
    }
    float _2495 = _2489;
    float _2497 = -_2437;
    float _2499 = -_2487;
    float _2501 = fma(_2415, _2497, _2499);
    float _2503 = as_type<float>(_2087);
    float _2505 = _2501;
    if (_2451)
    {
        float _2507 = _2495 * 6.283185482025146484375;
        float _2509 = sin(_2507);
        _2503 = _2509;
    }
    float _2511 = _2503;
    if (_2451)
    {
        float _2513 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2463 = _2513;
    }
    float _2515 = _2463;
    float _2517 = _2485;
    float _2519 = _2515;
    if (_2451)
    {
        float _2521 = _2495 * 6.283185482025146484375;
        float _2523 = cos(_2521);
        _2517 = _2523;
    }
    float _2525 = _2517;
    float _2527 = _2511;
    if (_2451)
    {
        float _2529 = fma(_2511, _2515, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2527 = _2529;
    }
    float _2531 = _2527;
    if (_2451)
    {
        float _2533 = _2481 * _2531;
        _2491 = _2533;
    }
    float _2535 = _2491;
    float _2537 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2451)
    {
        float _2539 = _2525 + (-1.0);
        _2465 = _2539;
    }
    float _2541 = _2465;
    if (_2451)
    {
        float _2543 = _2439 * _2535;
        _2467 = _2543;
    }
    float _2545 = _2467;
    if (_2451)
    {
        float _2547 = _2441 * _2535;
        _2469 = _2547;
    }
    float _2549 = _2469;
    float _2551 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2537);
    if (_2451)
    {
        float _2553 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2519 = _2553;
    }
    float _2555 = _2519;
    if (_2451)
    {
        float _2557 = _2545 * _2545;
        _2471 = _2557;
    }
    float _2559 = _2471;
    if (_2451)
    {
        float _2561 = _2549 * _2549;
        _2473 = _2561;
    }
    float _2563 = _2473;
    if (_2451)
    {
        float _2565 = fma(_2501, _2525, _2555);
        _2505 = _2565;
    }
    float _2567 = _2505;
    float _2569 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2571 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2551);
    float _2573 = fma(_2567, _2567, _2559);
    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2577 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2575);
    float _2579 = precise::clamp(_2577, 0.0, 1.0);
    float _2581 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2583 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2585 = _2573 + _2563;
    float _2587 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2569);
    float _2589 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2591 = -_2579;
    float _2593 = _2591 + 1.0;
    float _2595 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2583);
    float _2597 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2587);
    float _2599 = rsqrt(_2585);
    float _2601 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2589);
    float _2603 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2595);
    float _2605 = _2597 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2607 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2601);
    float _2609 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2611 = abs(_2593);
    float _2613 = log2(_2611);
    float _2615 = _2607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2617 = -_2609;
    float _2619 = fma(_2617, _2581, 1.0);
    float _2621 = _2603 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2623 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2625 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2627 = _2599 * _2545;
    float _2629 = _2599 * _2567;
    float _2631 = _2571 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2633 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2623);
    float _2635 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2637 = _2599 * _2549;
    float _2639 = log2(_2619);
    float _2641 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2633);
    float _2643 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2645 = -_2635;
    float _2647 = fma(_2629, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2645);
    float _2649 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2625);
    float _2651 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2641);
    float _2653 = _2629 + 1.0;
    float _2655 = exp2(_2643);
    float _2657 = -_2637;
    float _2659 = fma(_2657, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2647);
    float _2661 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2663 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2649);
    float _2665 = fma(_2659, -0.5, 0.5);
    float _2667 = fma(_2659, 0.5, 0.5);
    float _2669 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2661);
    float _2671 = 1.0 / _2651;
    float _2673 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2663);
    float _2675 = fma(_2667, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2677 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2669);
    float _2679 = _2639 * 0.693147182464599609375;
    float _2681 = sqrt(_2665);
    float _2683 = -_2629;
    float _2685 = fma(_2655, _2653, _2683);
    float _2687 = fma(_2667, _2675, -0.212114393711090087890625);
    float _2689 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2677);
    float _2691 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2693 = fma(_2667, _2687, 1.570728778839111328125);
    float _2695 = _2673 * _2671;
    float _2697 = _2689 * _2671;
    float _2699 = fma(_2695, 0.5, 0.5);
    float _2701 = fma(_2697, -0.5, 0.5);
    float _2703 = _2681 * 0.636619746685028076171875;
    float3 _6839 = float3(_2699, _2701, _2691);
    float _2705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6839, float3(0.0), isnan(_6839)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6839, float3(0.0), isnan(_6839)), level(0.0)).x;
    float _2707 = -_2693;
    float _2709 = fma(_2703, _2707, 1.0);
    float _2711 = fma(_2685, 0.5, 0.5);
    float3 _6857 = float3(_2699, _2701, _2691);
    float4 _2713 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6857, float3(0.0), isnan(_6857)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6857, float3(0.0), isnan(_6857)), level(0.0)).xyzw;
    float _2715 = _2713.x;
    float _2717 = _2713.y;
    float _2719 = _2713.z;
    float _2721 = _2713.w;
    float2 _6873 = float2(_2709, _2711);
    float3 _2725 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6873, float2(0.0), isnan(_6873)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6873, float2(0.0), isnan(_6873)), level(0.0)).xyz;
    float _2727 = _2725.x;
    float _2729 = _2725.y;
    float _2731 = _2725.z;
    float _2733 = -_2089;
    float _2735 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1891);
    float _2737 = _1773 * 3.883221149444580078125;
    float _2739 = -_2091;
    float _2741 = fma(_2739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1893);
    float _2743 = -_2113;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1899);
    float _2747 = _2735 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2749 = _2737 * 0.15915493667125701904296875;
    float _2751 = _1805 * _1861;
    bool _2753 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2755 = isnan(0.5);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2761 = _2757 || _2759;
    float _2763 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2747);
    float _2765 = _1789 * 2.0;
    float _2767 = _2749 * 6.283185482025146484375;
    float _2769 = cos(_2767);
    float _2771 = -_1575;
    float _2773 = _2771 + _1775;
    float _2775 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2763);
    float _2777 = -_2765;
    float _2779 = fma(_2751, _2777, _2751);
    float _2781 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2783 = fma(_1721, _2773, _1575);
    float _2785 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2787 = _2735 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2789 = fma(_1789, 3.1415927410125732421875, _2779);
    float _2791 = _2749 * 6.283185482025146484375;
    float _2793 = sin(_2791);
    if (!_2761)
    {
        _2345 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2795 = _2345;
    float _2797 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2787);
    float _2799 = _2789 * 0.15915493667125701904296875;
    float _2801 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2783);
    out.m_63.x = _1603;
    out.m_63.y = _1601;
    out.m_63.z = _1611;
    out.m_63.w = _1557;
    float _2803 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2797);
    float _2805 = 1.0 / _2785;
    out.m_65.x = _642;
    out.m_65.y = _644;
    out.m_65.z = _648;
    out.m_65.w = _636;
    float _2807 = _2803 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_67.x = _1605;
    out.m_67.y = _1595;
    out.m_67.z = _1569;
    out.m_67.w = _1553;
    float _2809 = _2807 + _2785;
    float _2811 = _2799 * 6.283185482025146484375;
    float _2813 = sin(_2811);
    out.m_69.y = _2209;
    float _2815 = -_2801;
    float _2817 = _2237 * _2815;
    out.m_71.x = _2407;
    out.m_71.y = _2403;
    out.m_71.z = _2411;
    float _2819 = _2247 * _2801;
    float _2821 = _2809 * _2805;
    float _2823 = _2821 * 0.5;
    float _2825 = exp2(_2781);
    float _2827 = _2239 * _2801;
    float _2829 = _2823;
    float _2831 = _2795;
    float _2833 = _2805;
    if (_2761)
    {
        _2347 = 1.0;
    }
    float _2835 = _2347;
    float _2837 = _2835;
    if (!_2761)
    {
        float _2839 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2841 = fma(_2823, _2795, _2839);
        _2829 = _2841;
    }
    float _2843 = _2829;
    if (!_2761)
    {
        _2831 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2845 = _2831;
    float _2847 = -_1727;
    float _2849 = fma(_2813, _2769, _2847);
    float _2851 = -_1729;
    float _2853 = fma(_2813, _2793, _2851);
    float _2855 = _2843;
    if (!_2761)
    {
        float _2857 = 1.0 / _2843;
        _2855 = _2857;
    }
    float _2859 = _2855;
    if (!_2761)
    {
        float _2861 = -_2845;
        float _2863 = _2861 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2833 = _2863;
    }
    float _2865 = _2833;
    float _2867 = fma(_1721, _2849, _1727);
    float _2869 = fma(_1721, _2853, _1729);
    float _2871 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2867);
    float _2873 = fma(_1755, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2869);
    float _2875 = _2865;
    if (!_2761)
    {
        float _2877 = 1.0 / _2865;
        _2875 = _2877;
    }
    float _2879 = _2875;
    float _2881 = -_2825;
    float _2883 = _2881 + 1.0;
    float _2885 = fma(_2241, _2871, _2817);
    float _2887 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2889 = fma(_2259, _2871, _2819);
    float _2891 = fma(_2273, _2871, _2827);
    float _2893 = fma(_2253, _2873, _2885);
    float _2895 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2887);
    float _2897 = fma(_2263, _2873, _2889);
    float _2899 = _2859;
    if (!_2761)
    {
        float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2903 = -_2845;
        float _2905 = fma(_2859, _2901, _2903);
        _2899 = _2905;
    }
    float _2907 = _2899;
    float _2909 = fma(_2281, _2873, _2891);
    float _2911 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2895);
    float _2913 = _2897 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2915 = _2897 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2917 = _2897 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2919 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2911);
    float _2921 = fma(_2893, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2913);
    float _2923 = fma(_2893, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2915);
    float _2925 = fma(_2893, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2917);
    float _2927 = _2907;
    if (!_2761)
    {
        float _2929 = _2907 * _2879;
        float _2931 = precise::clamp(_2929, 0.0, 1.0);
        _2927 = _2931;
    }
    float _2933 = _2927;
    float _2935 = fma(_2909, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2921);
    float _2937 = fma(_2909, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2923);
    float _2939 = fma(_2909, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2925);
    float _2941 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2761)
    {
        float _2943 = -_2933;
        float _2945 = _2943 + 1.0;
        _2837 = _2945;
    }
    float _2947 = _2837;
    float _2949 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2951 = _2919 + _2949;
    out.m_73.x = _2937;
    out.m_73.y = _2935;
    out.m_73.z = _2939;
    float _2953 = _2947 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2955 = _2947 > 0.0;
    bool _2957 = isnan(_2947);
    bool _2959 = _2955 || _2957;
    bool _2961 = isnan(0.0);
    bool _2963 = _2959 || _2961;
    float _2965 = _2651 + _2951;
    float _2967 = _371 * _2953;
    float _2969 = _2965 * 0.5;
    float _2971 = _2967 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2673;
    out.gl_Position.y = _2689;
    out.gl_Position.z = _2951;
    out.gl_Position.w = _2651;
    float _2973 = -_2941;
    float _2975 = _2973 + 1.0;
    out.m_75.z = _2969;
    out.m_75.w = _2651;
    out.m_47.x = _2971;
    float _2977 = _2941 * _2705;
    float _2979 = _2721 * _2977;
    float _2981 = _2721 * _2975;
    float _2983 = _2731 * _2977;
    float _2985 = fma(_2727, _2979, _2715);
    float _2987 = fma(_2729, _2979, _2717);
    float _2989 = fma(_2721, _2983, _2719);
    out.m_77.x = _2985;
    out.m_77.y = _2987;
    out.m_77.z = _2989;
    out.m_77.w = _2981;
    if (_2963)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2991 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2991;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1837 = false;
    bool _1645 = false;
    bool _668 = false;
    bool _527 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _101 = int(_99);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3048 = as_type<float>(_117);
        out.gl_Position.z = _3048;
    }
    if (!_105)
    {
        return out;
    }
    float _121 = in.m_49.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = _135;
    if (_131)
    {
        float _139 = float(_101);
        _111 = _139;
    }
    float _141 = _111;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    float _149 = _141;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _149;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3118 = as_type<float>(_155);
        out.gl_Position.z = _3118;
    }
    if (_147)
    {
        return out;
    }
    float _157 = in.m_51.x;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = in.m_53.y;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _161 * _159;
    float _183 = 0.0;
    if (!_175)
    {
        float _185 = _165 * _165;
        float _187 = _185 * 0.5;
        _183 = _187;
    }
    float _189 = _183;
    float _191 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _193 = _189;
    if (!_175)
    {
        float _195 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = in.m_49.x;
    float _201 = in.m_49.y;
    float _203 = in.m_49.z;
    float _205 = _191 * 6.283185482025146484375;
    float _207 = floor(_191);
    float _209 = _205 * 0.15915493667125701904296875;
    float _211 = _209 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = -_207;
    float _217 = _191 + _215;
    float _219 = _207;
    float _221 = _197;
    if (!_175)
    {
        _219 = _165;
    }
    float _223 = _219;
    bool _225 = !_175;
    float _227 = _223;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _165 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _165);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _257;
    }
    float _259 = _221;
    bool _261 = !_175;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _165 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _227 = _281;
    }
    float _283 = _227;
    float _285 = in.m_55.w;
    float _287 = in.m_44.x;
    float _289 = in.m_44.y;
    float _291 = in.m_44.z;
    bool _293 = _217 < 0.5;
    float _295 = float(_293);
    float _297 = -_217;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _303 = _301 != 0;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _307 = _305 != 0;
    float _309 = fma(_213, 0.5, 0.5);
    float _311 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_57.y = _163;
    bool _317 = !_303;
    int _319 = _317 ? 0 : 1;
    float _321 = -_309;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = fma(_283, _199, _311);
    bool _327 = !_307;
    int _329 = _327 ? 0 : 1;
    float _331 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _333 = !_179;
    int _335 = _333 ? 0 : 1;
    float _337 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _339 = abs(_319);
    float _341 = fma(_283, _201, _331);
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_283, _203, _337);
    int _347 = abs(_329);
    int _349 = abs(_335);
    float _351 = float(_339);
    float _353 = fma(_325, _285, _287);
    float _355 = float(_349);
    float _357 = fma(_341, _285, _289);
    float _359 = float(_347);
    float _361 = abs(_299);
    float _363 = _351 * _361;
    float _365 = fma(_345, _285, _291);
    float _367 = fma(_355, _323, _363);
    float _369 = abs(_315);
    float _371 = fma(_359, _369, _367);
    bool _373 = !_343;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_101);
        float _395 = 1.0 / _393;
        float _397 = _135 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = in.m_55.x;
    float _407 = in.m_55.y;
    float _409 = in.m_55.z;
    bool _411 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_399);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _423;
    bool _427 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_399);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _441 = 1.0 / _425;
    float _443 = -_437;
    float _445 = _443 + 1.0;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _403 * _441;
    float _455 = fma(_451, _453, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _461;
    float _465 = _439 * _157;
    float _467 = _421 * _445;
    float _469 = fma(_459, _453, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = fma(_463, _453, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _473 = -_421;
    float _475 = _473 + 1.0;
    float _477 = _455 * _467;
    float _479 = trunc(_465);
    int _481 = int(_479);
    float _483 = _469 * _467;
    float _485 = _471 * _467;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _477);
    float _489 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].z, _485);
    float _493 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].x, _487);
    float _495 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].y, _489);
    float _497 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].z, _491);
    float _499 = _493 * _405;
    float _501 = _495 * _407;
    float _503 = _497 * _409;
    int _505 = _481 << 4;
    int _507 = _505 + 1712;
    bool _509 = !_447;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_101);
        float _531 = 1.0 / _529;
        float _533 = _135 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    uint _538 = uint(int(uint(_507) >> uint(2)));
    uint _540 = uint(int(uint(int(_538)) >> uint(2)));
    int _542 = int(_538) & 3;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[int(_540)][_542];
    int _546 = int(_538) + 1;
    uint _548 = uint(int(uint(_546) >> uint(2)));
    int _550 = _546 & 3;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[int(_548)][_550];
    bool _554 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_535);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _572 = _507 + 8;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    uint _576 = uint(int(uint(int(_574)) >> uint(2)));
    int _578 = int(_574) & 3;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[int(_576)][_578];
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = 1.0 / _568;
    float _588 = -_564;
    float _590 = _588 + 1.0;
    float _592 = _570 * _157;
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _596 = _584 * _586;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _535 + _598;
    bool _602 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _604 = isnan(_535);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_596, _600, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _616 = _612 * _590;
    float _618 = -_612;
    float _620 = _618 + 1.0;
    float _622 = trunc(_592);
    int _624 = int(_622);
    float _626 = _614 * _616;
    float _628 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _626);
    float _630 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[116].x, _628);
    float _632 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _634 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _636 = _630 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _638 = _624 << 4;
    int _640 = _638 + 1968;
    float _642 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _650 = !_594;
    float _666;
    if (!_650)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _654 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_101);
        float _672 = 1.0 / _670;
        float _674 = _135 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    int _678 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _680 = _678;
    int _682 = 0;
    int _684 = _92(_680, _682, (*spvDescriptorSet0.support_buffer));
    float _686 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _688 = int(_686);
    float _690 = fma(_135, 0.01200000010430812835693359375, _157);
    float _692 = in.m_53.z;
    float _694 = in.m_51.y;
    float _696 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _698 = int(_696);
    float _700 = float(_688);
    float _702 = floor(_690);
    float _704 = float(uint(_698));
    float _706 = 1.0 / _700;
    float _708 = 1.0 / _704;
    float _710 = _135 * _706;
    float _712 = trunc(_692);
    int _714 = int(_712);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _718 = _716 != 0;
    int _720 = as_type<int>(_708) + (-2);
    float _722 = trunc(_710);
    int _724 = int(_722);
    int _726 = ~_698;
    int _728 = _726 + 1;
    float _730 = float(uint(_724));
    float _732 = as_type<float>(_720) * _730;
    float _734 = fma(_702, 0.20000000298023223876953125, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = trunc(_732);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    int _744 = _728 * int(_742);
    int _746 = _744 + _724;
    float _748 = float(uint(_746));
    float _750 = as_type<float>(_720) * _748;
    float _752 = _694 * 1.2345600128173828125;
    bool _754 = !_718;
    float _756 = _754 ? _752 : _157;
    float _758 = trunc(_750);
    float _760 = precise::max(_758, 0.0);
    uint _762 = uint(_760);
    int _764 = _684 + (-1);
    float _766 = float(_764);
    float _768 = _736 * _766;
    float _770 = trunc(_768);
    int _772 = int(_770);
    int _774 = _772;
    int _776 = 0;
    int _778 = _93(_774, _776, (*spvDescriptorSet0.support_buffer));
    int _780 = _714;
    int _782 = 0;
    int _784 = _93(_780, _782, (*spvDescriptorSet0.support_buffer));
    float4 _787 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_778, _784)), 0).xyzw;
    float _789 = _787.x;
    float _791 = _787.y;
    float _793 = _787.z;
    float _795 = _787.w;
    int _797 = ~_698;
    int _799 = _797 + 1;
    float _801 = floor(_756);
    int _803 = int(_742) + int(_762);
    float _805 = float(_698);
    float _807 = float(_724);
    int _809 = _799 * _803;
    int _811 = _809 + _724;
    float _813 = float(_101);
    bool _815 = _807 >= _805;
    bool _817 = isnan(_807);
    bool _819 = _815 || _817;
    bool _821 = isnan(_805);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    bool _827 = uint(_811) >= uint(_698);
    float _829 = 1.0 / _813;
    bool _831 = _698 == 0;
    bool _833 = !_827;
    int _835 = _833 ? 0 : (-1);
    float _837 = -_801;
    float _839 = _756 + _837;
    int _841 = ~_803;
    int _843 = _841 + _835;
    int _845 = _843 + 1;
    float _847 = trunc(_825);
    int _849 = int(_847);
    float _851 = _839 * _805;
    float _853 = _135 * _805;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _865 = _863 != 0;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _869 = _867 != 0;
    int _871 = _698 * _845;
    int _873 = _871 + _724;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _877 = _875 != 0;
    int _879 = _698 + (-1);
    float _881 = _853 * _829;
    bool _883 = !_831;
    int _885 = _883 ? _873 : (-1);
    float _887 = trunc(_851);
    int _889 = int(_887);
    bool _891 = !_861;
    int _893 = _891 ? 0 : 1;
    bool _895 = !_857;
    int _897 = _895 ? 0 : 1;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _901 = _899 != 0;
    int _903 = ~_849;
    int _905 = _903 + 1;
    int _907 = _905 + 1;
    float _909 = trunc(_881);
    int _911 = int(_909);
    int _913 = ~_698;
    int _915 = _913 + 1;
    int _917 = _885 * _907;
    bool _919 = !_877;
    int _921 = _919 ? 0 : 1;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    int _927 = _849 * _879;
    int _929 = _927 + _917;
    int _931 = abs(_893);
    int _933 = abs(_921);
    bool _935 = !_865;
    int _937 = _935 ? 0 : 1;
    int _939 = _929 * _931;
    int _941 = abs(_897);
    int _943 = _889 * _933;
    int _945 = _943 + _724;
    bool _947 = !_869;
    int _949 = _947 ? 0 : 1;
    float _951 = in.m_53.x;
    int _953 = abs(_937);
    int _955 = abs(_949);
    int _957 = _911 * _941;
    int _959 = _957 + _939;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _963 = _961 != 0;
    int _965 = _945 * _953;
    int _967 = _965 + _959;
    int _969 = ~_698;
    int _971 = _969 + 1;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _975 = _973 != 0;
    int _977 = _889 * _955;
    int _979 = _977 + _967;
    float _981 = float(uint(_945));
    float _983 = float(uint(_979));
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _987 = ~_698;
    int _989 = _987 + 1;
    float _991 = as_type<float>(_720) * _981;
    float _993 = as_type<float>(_720) * _983;
    int _995 = ~_698;
    int _997 = _995 + 1;
    float _999 = trunc(_991);
    float _1001 = precise::max(_999, 0.0);
    uint _1003 = uint(_1001);
    float _1005 = trunc(_993);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    int _1011 = _997 * int(_1009);
    int _1013 = _1011 + _979;
    float _1015 = float(uint(_1013));
    float _1017 = as_type<float>(_720) * _1015;
    float _1019 = in.m_51.w;
    float _1021 = trunc(_1017);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    float _1027 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1029 = int(_1009) + int(_1025);
    float _1031 = as_type<float>(_971);
    float _1033 = as_type<float>(_979);
    float _1035 = _951;
    if (_963)
    {
        float _1037 = in.m_51.z;
        _1031 = _1037;
    }
    float _1039 = _1031;
    bool _1041 = _1019 > 0.5;
    bool _1043 = _1041 && _901;
    int _1045 = _971 * _1029;
    int _1047 = _1045 + _979;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1053 = uint(_1047) >= uint(_698);
    float _1055 = 1.0 / _1051;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1059 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1061 = !_1053;
    int _1063 = _1061 ? 0 : (-1);
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1067 = _1065 != 0;
    float _1069 = fma(_1059, -2.0, _985);
    float _1071 = -_1057;
    float _1073 = fma(_1027, 2.0, _1071);
    int _1075 = ~_1029;
    int _1077 = _1075 + _1063;
    int _1079 = _1077 + 1;
    float _1081 = -_163;
    float _1083 = _1081 + 1.0;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1085;
    bool _1089 = _694 > 0.5;
    bool _1091 = _1089 && _1067;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1095 = _698 * _1079;
    int _1097 = _1095 + _979;
    float _1099 = _1087 * _1055;
    float _1101 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1069);
    float _1103 = _1043 ? _1083 : _163;
    float _1105 = -_135;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1073);
    float _1109 = _1091 ? _1083 : _163;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1113 = _1043;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    bool _1117 = _1091;
    float _1119 = _1109;
    if (_963)
    {
        bool _1121 = _1039 > 0.5;
        _1113 = _1121;
    }
    bool _1123 = _1113;
    float _1125 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1127 = _1039;
    if (!_718)
    {
        float _1129 = in.m_51.z;
        _1127 = _1129;
    }
    float _1131 = _1127;
    bool _1133 = !_831;
    int _1135 = _1133 ? _1097 : (-1);
    float _1137 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1111);
    if (!_718)
    {
        _1115 = _694;
    }
    float _1139 = _1115;
    float _1141 = _1139;
    if (_925)
    {
        bool _1143 = _157 > 0.5;
        _1117 = _1143;
    }
    bool _1145 = _1117;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (_718)
    {
        _1141 = _157;
    }
    float _1149 = _1141;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1153 = _676 + _1151;
    int _1155 = _1135 >> 31;
    if (!_925)
    {
        _1033 = _951;
    }
    float _1157 = _1033;
    float _1159 = fma(_1099, _1153, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1161 = _1155 & 3;
    float _1163 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1165 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1147);
    float _1167 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1169 = _1135 + _1161;
    float _1171 = fma(_1163, _1109, -0.5);
    float _1173 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1165);
    int _1175 = _915 * int(_1003);
    int _1177 = _1175 + _945;
    int _1179 = _1169 >> 2;
    int _1181 = as_type<int>(_1163);
    float _1183 = _1157;
    int _1185 = as_type<int>(_1167);
    if (_925)
    {
        float _1187 = -_951;
        float _1189 = _1187 + 1.0;
        _1181 = as_type<int>(_1189);
    }
    int _1191 = _1181;
    float _1193 = _1131;
    if (!_718)
    {
        _1119 = _1131;
    }
    float _1195 = _1119;
    int _1197 = _1179 << 4;
    int _1199 = _1197 + 512;
    float _1201 = float(uint(_1177));
    float _1203 = _1195;
    if (_925)
    {
        float _1205 = _1145 ? as_type<float>(_1191) : _951;
        _1183 = _1205;
    }
    float _1207 = _1183;
    if (_718)
    {
        _1203 = _694;
    }
    float _1209 = _1203;
    uint _1211 = uint(int(uint(_1199) >> uint(2)));
    uint _1213 = uint(int(uint(int(_1211)) >> uint(2)));
    int _1215 = int(_1211) & 3;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[int(_1213)][_1215];
    int _1219 = int(_1211) + 1;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    int _1223 = _1219 & 3;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[int(_1221)][_1223];
    if (_718)
    {
        _1193 = _694;
    }
    float _1227 = _1193;
    float _1229 = -_1101;
    float _1231 = fma(_1173, _1171, _1229);
    float _1233 = as_type<float>(_720) * _1201;
    bool _1235 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1237 = isnan(_676);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1243 = _1239 || _1241;
    float _1245 = float(_1243);
    float _1247 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1249 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1251 = isnan(_676);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = trunc(_1233);
    float _1263 = precise::max(_1261, 0.0);
    uint _1265 = uint(_1263);
    float _1267 = -_1245;
    float _1269 = _1267 + 1.0;
    int _1271 = _1135 & 3;
    bool _1273 = _1271 != 0;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1277 = _1259 * _1269;
    int _1279 = _1135 & 3;
    bool _1281 = _1279 != 0;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1285 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1275);
    int _1287 = _1273 ? 0 : 1;
    int _1289 = _1199 + 8;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    bool _1307 = uint(_1279) > 1u;
    float _1309 = _1159 * _1277;
    float _1311 = -_1283;
    float _1313 = fma(_1167, 2.0, _1311);
    if (_963)
    {
        float _1315 = -_951;
        float _1317 = _1315 + 1.0;
        _1185 = as_type<int>(_1317);
    }
    int _1319 = _1185;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1323 = int(_1003) + int(_1265);
    float _1325 = -_135;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1313);
    float _1329 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1321);
    if (_963)
    {
        float _1331 = _1123 ? as_type<float>(_1319) : _951;
        _1035 = _1331;
    }
    float _1333 = _1035;
    float _1335 = -_1259;
    float _1337 = _1335 + 1.0;
    bool _1339 = _1279 != 3;
    int _1341 = _989 * _1323;
    int _1343 = _1341 + _945;
    int _1345 = ~_1287;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    float _1351 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1309);
    int _1353 = _1349;
    if (!_1307)
    {
        int _1355 = ~_1287;
        int _1357 = _1355 + 1;
        _1353 = _1357;
    }
    int _1359 = _1353;
    float _1361 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _1363 = uint(_1279) >= 2u;
    float _1365 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1351);
    int _1367 = abs(_1359);
    bool _1369 = uint(_1343) >= uint(_698);
    int _1371 = _1363 ? 0 : 1;
    bool _1373 = !_1281;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = ~_1367;
    int _1379 = _1377 + 1;
    int _1381 = _1379 + 1;
    bool _1383 = !_1369;
    int _1385 = _1383 ? 0 : (-1);
    int _1387 = ~_1371;
    int _1389 = _1387 + 1;
    int _1391 = _1389 + 1;
    bool _1393 = _1279 != 3;
    int _1395 = _1391;
    if (_1339)
    {
        int _1397 = ~_1371;
        int _1399 = _1397 + 1;
        _1395 = _1399;
    }
    int _1401 = _1395;
    int _1403 = _1381 * as_type<int>(_1225);
    int _1405 = abs(_1375);
    float _1407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1409 = ~_1323;
    int _1411 = _1409 + _1385;
    int _1413 = _1411 + 1;
    bool _1415 = !_1393;
    int _1417 = _1415 ? 0 : (-1);
    int _1419 = abs(_1401);
    int _1421 = _698 * _1413;
    int _1423 = _1421 + _945;
    int _1425 = ~_1405;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    int _1431 = _640 + 8;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    uint _1435 = uint(int(uint(int(_1433)) >> uint(2)));
    int _1437 = int(_1433) & 3;
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[int(_1435)][_1437];
    bool _1441 = !_975;
    int _1443 = _1441 ? 0 : 1;
    int _1445 = abs(_1417);
    int _1447 = _1429 * as_type<int>(_1217);
    int _1449 = _1447 + _1403;
    int _1451 = abs(_1443);
    int _1453 = ~_1419;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1461 = ~_1445;
    int _1463 = _1461 + 1;
    int _1465 = _1463 + 1;
    int _1467 = _1457 * as_type<int>(_1297);
    int _1469 = _1467 + _1449;
    int _1471 = ~_1451;
    int _1473 = _1471 + 1;
    int _1475 = _1473 + 1;
    float _1477 = fma(_1247, -2.0, _1459);
    int _1479 = _1465 * as_type<int>(_1305);
    int _1481 = _1479 + _1469;
    float _1483 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1485 = !_831;
    int _1487 = _1485 ? _1423 : (-1);
    float _1489 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1285);
    int _1491 = _1481 * _1475;
    float _1493 = fma(_1483, _1207, -0.5);
    uint _1495 = as_type<uint>(half2(float2(_795, 0.0)));
    float _1497 = fma(_1489, _1361, _1327);
    int _1499 = _1487 * _1451;
    int _1501 = _1499 + _1491;
    float _1503 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1137);
    uint _1505 = extract_bits(_1495, 0u, 8u);
    int _1507 = int(_1505) & 255;
    uint _1509 = extract_bits(_1495, 8u, 8u);
    int _1511 = int(_1509) & 255;
    int _1513 = _1511 << 8;
    int _1515 = _1507 | _1513;
    float _1517 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1329);
    float _1519 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1477);
    float _1521 = float(_1501);
    float _1523 = fma(_1503, _1493, _1107);
    bool _1525 = _1515 >= 32768;
    uint _1527 = uint(int(uint(_640) >> uint(2)));
    uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
    int _1531 = int(_1527) & 3;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[int(_1529)][_1531];
    int _1535 = int(_1527) + 1;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    int _1539 = _1535 & 3;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[int(_1537)][_1539];
    int _1543 = _772 + 1;
    out.m_59.y = _1521;
    float _1545 = -_1519;
    float _1547 = fma(_1517, _1125, _1545);
    int _1549 = min(_764, _1543);
    int _1551 = _1515 + (-1024);
    float _1553 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1555 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1557 = _1547 + 0.5;
    int _1559 = _1551;
    if (_1525)
    {
        int _1561 = ~_1515;
        int _1563 = _1561 + 33792;
        int _1565 = _1563 + 1;
        _1559 = _1565;
    }
    int _1567 = _1559;
    float _1569 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1571 = _1567 + 30719;
    float _1573 = float(_1571);
    float _1575 = fma(_1573, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1577 = abs(_1575);
    float _1579 = -_1577;
    float _1581 = _1579 + 1.0;
    bool _1583 = _1575 < 0.0;
    float _1585 = float(_1583);
    int _1587 = as_type<int>(_1581) + (-218103808);
    bool _1589 = uint(_1587) >= 1920991232u;
    float _1591 = _1541 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1593 = _1533 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1595 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1597 = abs(_1575);
    float _1599 = fma(_1597, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1601 = _1231 + 0.5;
    float _1603 = _1523 + 0.5;
    float _1605 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1607 = abs(_1575);
    float _1609 = fma(_1607, _1599, -0.212114393711090087890625);
    float _1611 = _1497 + 0.5;
    float _1613 = abs(_1575);
    float _1615 = fma(_1613, _1609, 1.570728778839111328125);
    bool _1617 = !_1589;
    float _1643;
    if (!_1617)
    {
        int _1619 = as_type<int>(_1581);
        int _1621 = as_type<int>(_1207);
        int _1623 = 7712;
        int _1625 = as_type<int>(_1581);
        int _1627 = _1449;
        int _1629;
        int _1631;
        int _1633;
        int _1635;
        int _1637;
        int _1639;
        int _1641;
        _90(_1619, _1621, _1623, _1625, _1627, _1629, _1631, _1633, _1635, _1637, _1639, _1641, out.gl_Position, out.gl_PointSize);
        _1643 = as_type<float>(_1639);
        _1645 = true;
    }
    else
    {
        float _1647 = rsqrt(_1581);
        float _1649 = _1581 * _1647;
        float _1651 = _1647 * 0.5;
        float _1653 = -_1649;
        float _1655 = 0.0 + _1653;
        float _1657 = fma(_1651, _1655, 0.5);
        float _1659 = fma(_1649, _1657, _1649);
        float _1661 = -_1659;
        float _1663 = 0.0 + _1661;
        float _1665 = fma(_1659, _1663, _1581);
        float _1667 = fma(_1651, _1665, _1659);
        _1643 = _1667;
    }
    _1645 = false;
    float _1669 = _1643;
    int _1671 = _1549;
    int _1673 = 0;
    int _1675 = _93(_1671, _1673, (*spvDescriptorSet0.support_buffer));
    int _1677 = _714;
    int _1679 = 0;
    int _1681 = _93(_1677, _1679, (*spvDescriptorSet0.support_buffer));
    float4 _1683 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1675, _1681)), 0).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float _1693 = _1615 * _1669;
    float _1695 = _1585 * 2.0;
    float _1697 = _1573 * 3.883221149444580078125;
    float _1699 = floor(_768);
    float _1701 = -_1695;
    float _1703 = fma(_1693, _1701, _1693);
    float _1705 = _1697 * 0.15915493667125701904296875;
    float _1707 = fma(_1585, 3.1415927410125732421875, _1703);
    float _1709 = _1705 * 6.283185482025146484375;
    float _1711 = cos(_1709);
    float _1713 = _1707 * 0.15915493667125701904296875;
    float _1715 = _1713 * 6.283185482025146484375;
    float _1717 = sin(_1715);
    float _1719 = -_1699;
    float _1721 = _768 + _1719;
    float _1723 = _1705 * 6.283185482025146484375;
    float _1725 = sin(_1723);
    float _1727 = _1717 * _1711;
    float _1729 = _1717 * _1725;
    uint _1731 = as_type<uint>(half2(float2(_1691, 0.0)));
    float _1733 = -_789;
    float _1735 = _1733 + _1685;
    float _1737 = -_793;
    float _1739 = _1737 + _1689;
    uint _1741 = extract_bits(_1731, 0u, 8u);
    int _1743 = int(_1741) & 255;
    uint _1745 = extract_bits(_1731, 8u, 8u);
    int _1747 = int(_1745) & 255;
    int _1749 = _1747 << 8;
    int _1751 = _1743 | _1749;
    float _1753 = fma(_1721, _1735, _789);
    float _1755 = fma(_1721, _1739, _793);
    bool _1757 = _1751 >= 32768;
    int _1759 = _1751 + (-1024);
    int _1761 = _1759;
    if (_1757)
    {
        int _1763 = ~_1751;
        int _1765 = _1763 + 33792;
        int _1767 = _1765 + 1;
        _1761 = _1767;
    }
    int _1769 = _1761;
    int _1771 = _1769 + 30719;
    float _1773 = float(_1771);
    float _1775 = fma(_1773, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1777 = abs(_1775);
    float _1779 = -_1777;
    float _1781 = _1779 + 1.0;
    float _1783 = abs(_1775);
    float _1785 = fma(_1783, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1787 = _1775 < 0.0;
    float _1789 = float(_1787);
    int _1791 = as_type<int>(_1781) + (-218103808);
    float _1793 = abs(_1775);
    float _1795 = fma(_1793, _1785, -0.212114393711090087890625);
    bool _1797 = uint(_1791) >= 1920991232u;
    float _1799 = -_791;
    float _1801 = _1799 + _1687;
    float _1803 = abs(_1775);
    float _1805 = fma(_1803, _1795, 1.570728778839111328125);
    float _1807 = fma(_1721, _1801, _791);
    bool _1809 = !_1797;
    float _1835;
    if (!_1809)
    {
        int _1811 = as_type<int>(_1781);
        int _1813 = as_type<int>(_1687);
        int _1815 = 8608;
        int _1817 = as_type<int>(_1699);
        int _1819 = as_type<int>(_1669);
        int _1821;
        int _1823;
        int _1825;
        int _1827;
        int _1829;
        int _1831;
        int _1833;
        _90(_1811, _1813, _1815, _1817, _1819, _1821, _1823, _1825, _1827, _1829, _1831, _1833, out.gl_Position, out.gl_PointSize);
        _1835 = as_type<float>(_1831);
        _1837 = true;
    }
    else
    {
        float _1839 = rsqrt(_1781);
        float _1841 = _1781 * _1839;
        float _1843 = _1839 * 0.5;
        float _1845 = -_1841;
        float _1847 = 0.0 + _1845;
        float _1849 = fma(_1843, _1847, 0.5);
        float _1851 = fma(_1841, _1849, _1841);
        float _1853 = -_1851;
        float _1855 = 0.0 + _1853;
        float _1857 = fma(_1851, _1855, _1781);
        float _1859 = fma(_1843, _1857, _1851);
        _1835 = _1859;
    }
    _1837 = false;
    float _1861 = _1835;
    float _1863 = in.m_51.x;
    float _1865 = in.m_51.y;
    float _1867 = in.m_51.z;
    float _1869 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1871 = log2(_1869);
    float _1873 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1875 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1877 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1879 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1873);
    float _1881 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1875);
    float _1883 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1877);
    float _1885 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1879);
    float _1887 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1881);
    float _1889 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1883);
    float _1891 = _1885 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1893 = _1887 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1895 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1897 = _1871 * _135;
    float _1899 = _1889 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1903 = _1893 + _1901;
    float _1905 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1907 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1909 = exp2(_1897);
    float _1911 = _1863 * 2.0;
    float _1913 = _1867 * 2.0;
    float _1915 = _1865 * 2.0;
    float _1917 = floor(_1911);
    float _1919 = floor(_1913);
    float _1921 = floor(_1915);
    bool _1923 = _1917 > 0.0;
    bool _1925 = _1917 >= 0.0;
    bool _1927 = isnan(_1917);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(0.0);
    bool _1933 = _1929 || _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1937 = _1891 + _1935;
    int _1939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1941 = _1939 != 0;
    int _1943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1945 = _1943 != 0;
    int _1947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1949 = _1947 != 0;
    float _1951 = _1937 * _1937;
    bool _1953 = _1919 >= 0.0;
    bool _1955 = isnan(_1919);
    bool _1957 = _1953 || _1955;
    bool _1959 = isnan(0.0);
    bool _1961 = _1957 || _1959;
    float _1963 = _1865 + _1867;
    int _1965 = _1933 ? 0 : 1;
    float _1967 = fma(_1903, _1903, _1951);
    int _1969 = _1961 ? 0 : 1;
    float _1971 = _1963 + (-1.0);
    bool _1973 = _1919 > 0.0;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1977 = _1899 + _1975;
    bool _1979 = _1921 > 0.0;
    bool _1981 = _1921 >= 0.0;
    bool _1983 = isnan(_1921);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(0.0);
    bool _1989 = _1985 || _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1993 = 1.0 + _1991;
    int _1995 = ~_1965;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    float _2001 = fma(_1977, _1977, _1967);
    int _2003 = _1999;
    if (!_1923)
    {
        int _2005 = ~_1965;
        int _2007 = _2005 + 1;
        _2003 = _2007;
    }
    int _2009 = _2003;
    float _2011 = in.m_61.x;
    float _2013 = in.m_61.y;
    float _2015 = in.m_61.z;
    float _2017 = 1.0 / _1993;
    bool _2019 = !_1945;
    int _2021 = _2019 ? 0 : 1;
    bool _2023 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2025 = isnan(1.0);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2031 = _2027 || _2029;
    int _2033 = abs(_2021);
    float _2035 = -_1909;
    float _2037 = _2035 + 1.0;
    bool _2039 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2041 = isnan(0.0);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2047 = _2043 || _2045;
    float _2049 = rsqrt(_2001);
    float _2051 = float(_2033);
    float _2053 = _2047 ? _2037 : 0.0;
    float _2055 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2057 = float(_2009);
    int _2059 = ~_1969;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    int _2065 = _2063;
    if (_2031)
    {
        float _2067 = _2053 * _2017;
        _137 = _2067;
    }
    float _2069 = _137;
    bool _2071 = !_1941;
    int _2073 = _2071 ? 0 : 1;
    float _2075 = _2051 * _2057;
    if (!_1973)
    {
        int _2077 = ~_1969;
        int _2079 = _2077 + 1;
        _2065 = _2079;
    }
    int _2081 = _2065;
    int _2083 = abs(_2073);
    float _2085 = _2075 * (-2.0);
    int _2087 = _1989 ? 0 : 1;
    float _2089 = _1937 * _2049;
    float _2091 = _1903 * _2049;
    float _2093 = fma(_2055, _2085, _2055);
    float _2095 = fma(_2085, _2013, _2013);
    float _2097 = -_2089;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1937);
    float _2101 = -_2091;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1903);
    float _2105 = _1865 + (-0.5);
    float _2107 = float(_2083);
    float _2109 = _2099 * _2099;
    float _2111 = float(_2081);
    float _2113 = _1977 * _2049;
    float _2115 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2095);
    float _2117 = fma(_2103, _2103, _2109);
    bool _2119 = !_1949;
    int _2121 = _2119 ? 0 : 1;
    float _2123 = _2107 * _2111;
    int _2125 = ~_2087;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    float _2131 = -_2113;
    float _2133 = fma(_2131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1977);
    int _2135 = _2129;
    if (!_1979)
    {
        int _2137 = ~_2087;
        int _2139 = _2137 + 1;
        _2135 = _2139;
    }
    int _2141 = _2135;
    float _2143 = _1865 + _1863;
    int _2145 = abs(_2121);
    float _2147 = _1863 + _1867;
    float _2149 = float(_2141);
    float _2151 = fma(_2133, _2133, _2117);
    float _2153 = float(_2145);
    float _2155 = _2147 + (-1.0);
    float _2157 = _2143 + (-1.0);
    float _2159 = fma(_2093, _2069, _2115);
    float _2161 = _2153 * _2149;
    float _2163 = fma(_2157, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2165 = _2123 * (-2.0);
    float _2167 = _2161 * (-2.0);
    float _2169 = _2159 * 0.15915493667125701904296875;
    float _2171 = fma(_2155, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2173 = fma(_2165, _2011, _2011);
    float _2175 = fma(_2163, _2165, _2163);
    float _2177 = _1863 + (-0.5);
    float _2179 = _1867 + (-0.5);
    float _2181 = fma(_2167, _2015, _2015);
    float _2183 = fma(_2171, _2167, _2171);
    float _2185 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2173);
    float _2187 = sqrt(_2151);
    float _2189 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2181);
    float _2191 = fma(_2175, _2069, _2185);
    float _2193 = fma(_2183, _2069, _2189);
    float _2195 = _2191 * 0.15915493667125701904296875;
    float _2197 = _2169 * 6.283185482025146484375;
    float _2199 = sin(_2197);
    float _2201 = _2193 * 0.15915493667125701904296875;
    float _2203 = _2169 * 6.283185482025146484375;
    float _2205 = cos(_2203);
    float _2207 = _2049 * _2187;
    float _2209 = _1895 * _2207;
    float _2211 = _1905 * _2207;
    float _2213 = _1907 * _2207;
    float _2215 = _2195 * 6.283185482025146484375;
    float _2217 = sin(_2215);
    float _2219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1755);
    float _2221 = _2213 * _2219;
    float _2223 = _2201 * 6.283185482025146484375;
    float _2225 = cos(_2223);
    float _2227 = _2195 * 6.283185482025146484375;
    float _2229 = cos(_2227);
    float _2231 = _2217 * _2199;
    float _2233 = _2217 * _2205;
    float _2235 = _2201 * 6.283185482025146484375;
    float _2237 = sin(_2235);
    float _2239 = _2217 * _2225;
    float _2241 = _2205 * _2225;
    float _2243 = _2229 * _2205;
    float _2245 = _2229 * _2199;
    float _2247 = _2229 * _2225;
    float _2249 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1807);
    float _2251 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1753);
    float _2253 = _2199 * _2225;
    float _2255 = _2209 * _2249;
    float _2257 = _2211 * _2251;
    float _2259 = fma(_2237, _2243, _2231);
    float _2261 = -_2233;
    float _2263 = fma(_2237, _2245, _2261);
    float _2265 = _2247 * _2255;
    float _2267 = -_2255;
    float _2269 = _2237 * _2267;
    float _2271 = -_2245;
    float _2273 = fma(_2237, _2233, _2271);
    float _2275 = _2239 * _2255;
    float _2277 = fma(_2259, _2257, _2265);
    float _2279 = fma(_2241, _2257, _2269);
    float _2281 = fma(_2237, _2231, _2243);
    float _2283 = fma(_2273, _2257, _2275);
    float _2285 = fma(_2263, _2221, _2277);
    float _2287 = fma(_2253, _2221, _2279);
    float _2289 = fma(_2281, _2221, _2283);
    float _2291 = _2285 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2293 = _2285 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2295 = _2285 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2297 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2291);
    float _2299 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2293);
    float _2301 = _702 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2303 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2295);
    float _2305 = fma(_2289, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2297);
    float _2307 = fma(_2289, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2299);
    float _2309 = fma(_2289, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2303);
    float _2311 = _1899 + _2305;
    float _2313 = _1893 + _2307;
    float _2315 = _1891 + _2309;
    float _2317 = fma(_2301, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2311);
    float _2319 = fma(_2301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2313);
    float _2321 = fma(_2301, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2315);
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2325 = _2317 + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2329 = _2319 + _2327;
    float _2331 = _2325 * _2325;
    float _2333 = fma(_2329, _2329, _2331);
    float _2335 = sqrt(_2333);
    bool _2337 = _2335 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2339 = _2295;
    float _2341 = _2315;
    float _2343 = _2321;
    float _2345 = 0.5;
    float _2347 = _2247;
    if (!_2337)
    {
        _2339 = _2319;
    }
    float _2349 = _2339;
    float _2351 = _2349;
    if (!_2337)
    {
        _2341 = _2317;
    }
    float _2353 = _2341;
    bool _2355 = !_2337;
    float _2357 = _2353;
    if (!_2355)
    {
        float _2359 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2363 = _2335 + _2361;
        float _2365 = rsqrt(_2333);
        float _2367 = _2363 * _2359;
        float _2369 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2371 = _2367 * 0.15915493667125701904296875;
        float _2373 = _2371 * 6.283185482025146484375;
        float _2375 = cos(_2373);
        float _2377 = _2371 * 6.283185482025146484375;
        float _2379 = sin(_2377);
        float _2381 = _2375 + (-1.0);
        float _2383 = fma(_2379, _2369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2385 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2387 = _2365 * _2383;
        float _2389 = fma(_2321, _2375, _2385);
        float _2391 = fma(_2329, _2387, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2393 = fma(_2325, _2387, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2343 = _2389;
        _2351 = _2391;
        _2357 = _2393;
    }
    float _2395 = _2343;
    float _2397 = _2351;
    float _2399 = _2357;
    float _2401 = -_2089;
    float _2403 = fma(_2401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2395);
    float _2405 = -_2091;
    float _2407 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2397);
    float _2409 = -_2113;
    float _2411 = fma(_2409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2399);
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2415 = _2403 + _2413;
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2419 = _2407 + _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2423 = _2411 + _2421;
    float _2425 = _2415 * _2415;
    float _2427 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2429 = fma(_2419, _2419, _2425);
    float _2431 = fma(_2423, _2423, _2429);
    float _2433 = rsqrt(_2431);
    float _2435 = sqrt(_2431);
    float _2437 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2439 = _2419 * _2437;
    float _2441 = _2423 * _2437;
    float _2443 = _2439 * _2439;
    float _2445 = _2441 * _2441;
    float _2447 = _2443 + _2445;
    float _2449 = sqrt(_2447);
    bool _2451 = _2449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2455 = _2449 + _2453;
    float _2457 = _2109;
    float _2459 = _2447;
    float _2461 = _2455;
    float _2463 = _2437;
    float _2465 = _2415;
    float _2467 = _2439;
    float _2469 = _2441;
    float _2471 = _2443;
    float _2473 = _2445;
    if (_2451)
    {
        float _2475 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2457 = _2475;
    }
    float _2477 = _2457;
    if (_2451)
    {
        float _2479 = rsqrt(_2447);
        _2459 = _2479;
    }
    float _2481 = _2459;
    if (_2451)
    {
        float _2483 = _2455 * _2477;
        _2461 = _2483;
    }
    float _2485 = _2461;
    float _2487 = precise::max(0.0, _2427);
    float _2489 = 0.0;
    float _2491 = _2487;
    if (_2451)
    {
        float _2493 = _2485 * 0.15915493667125701904296875;
        _2489 = _2493;
    }
    float _2495 = _2489;
    float _2497 = -_2437;
    float _2499 = -_2487;
    float _2501 = fma(_2415, _2497, _2499);
    float _2503 = as_type<float>(_2087);
    float _2505 = _2501;
    if (_2451)
    {
        float _2507 = _2495 * 6.283185482025146484375;
        float _2509 = sin(_2507);
        _2503 = _2509;
    }
    float _2511 = _2503;
    if (_2451)
    {
        float _2513 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2463 = _2513;
    }
    float _2515 = _2463;
    float _2517 = _2485;
    float _2519 = _2515;
    if (_2451)
    {
        float _2521 = _2495 * 6.283185482025146484375;
        float _2523 = cos(_2521);
        _2517 = _2523;
    }
    float _2525 = _2517;
    float _2527 = _2511;
    if (_2451)
    {
        float _2529 = fma(_2511, _2515, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2527 = _2529;
    }
    float _2531 = _2527;
    if (_2451)
    {
        float _2533 = _2481 * _2531;
        _2491 = _2533;
    }
    float _2535 = _2491;
    float _2537 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2451)
    {
        float _2539 = _2525 + (-1.0);
        _2465 = _2539;
    }
    float _2541 = _2465;
    if (_2451)
    {
        float _2543 = _2439 * _2535;
        _2467 = _2543;
    }
    float _2545 = _2467;
    if (_2451)
    {
        float _2547 = _2441 * _2535;
        _2469 = _2547;
    }
    float _2549 = _2469;
    float _2551 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2537);
    if (_2451)
    {
        float _2553 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2519 = _2553;
    }
    float _2555 = _2519;
    if (_2451)
    {
        float _2557 = _2545 * _2545;
        _2471 = _2557;
    }
    float _2559 = _2471;
    if (_2451)
    {
        float _2561 = _2549 * _2549;
        _2473 = _2561;
    }
    float _2563 = _2473;
    if (_2451)
    {
        float _2565 = fma(_2501, _2525, _2555);
        _2505 = _2565;
    }
    float _2567 = _2505;
    float _2569 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2571 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2551);
    float _2573 = fma(_2567, _2567, _2559);
    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2577 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2575);
    float _2579 = precise::clamp(_2577, 0.0, 1.0);
    float _2581 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2583 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2585 = _2573 + _2563;
    float _2587 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2569);
    float _2589 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2591 = -_2579;
    float _2593 = _2591 + 1.0;
    float _2595 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2583);
    float _2597 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2587);
    float _2599 = rsqrt(_2585);
    float _2601 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2589);
    float _2603 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2595);
    float _2605 = _2597 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2607 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2601);
    float _2609 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2611 = abs(_2593);
    float _2613 = log2(_2611);
    float _2615 = _2607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2617 = -_2609;
    float _2619 = fma(_2617, _2581, 1.0);
    float _2621 = _2603 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2623 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2625 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2627 = _2599 * _2545;
    float _2629 = _2599 * _2567;
    float _2631 = _2571 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2633 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2623);
    float _2635 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2637 = _2599 * _2549;
    float _2639 = log2(_2619);
    float _2641 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2633);
    float _2643 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2645 = -_2635;
    float _2647 = fma(_2629, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2645);
    float _2649 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2625);
    float _2651 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2641);
    float _2653 = _2629 + 1.0;
    float _2655 = exp2(_2643);
    float _2657 = -_2637;
    float _2659 = fma(_2657, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2647);
    float _2661 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2663 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2649);
    float _2665 = fma(_2659, -0.5, 0.5);
    float _2667 = fma(_2659, 0.5, 0.5);
    float _2669 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2661);
    float _2671 = 1.0 / _2651;
    float _2673 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2663);
    float _2675 = fma(_2667, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2677 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2669);
    float _2679 = _2639 * 0.693147182464599609375;
    float _2681 = sqrt(_2665);
    float _2683 = -_2629;
    float _2685 = fma(_2655, _2653, _2683);
    float _2687 = fma(_2667, _2675, -0.212114393711090087890625);
    float _2689 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2677);
    float _2691 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2693 = fma(_2667, _2687, 1.570728778839111328125);
    float _2695 = _2673 * _2671;
    float _2697 = _2689 * _2671;
    float _2699 = fma(_2695, 0.5, 0.5);
    float _2701 = fma(_2697, -0.5, 0.5);
    float _2703 = _2681 * 0.636619746685028076171875;
    float3 _6839 = float3(_2699, _2701, _2691);
    float _2705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6839, float3(0.0), isnan(_6839)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6839, float3(0.0), isnan(_6839)), level(0.0)).x;
    float _2707 = -_2693;
    float _2709 = fma(_2703, _2707, 1.0);
    float _2711 = fma(_2685, 0.5, 0.5);
    float3 _6857 = float3(_2699, _2701, _2691);
    float4 _2713 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6857, float3(0.0), isnan(_6857)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6857, float3(0.0), isnan(_6857)), level(0.0)).xyzw;
    float _2715 = _2713.x;
    float _2717 = _2713.y;
    float _2719 = _2713.z;
    float _2721 = _2713.w;
    float2 _6873 = float2(_2709, _2711);
    float3 _2725 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6873, float2(0.0), isnan(_6873)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6873, float2(0.0), isnan(_6873)), level(0.0)).xyz;
    float _2727 = _2725.x;
    float _2729 = _2725.y;
    float _2731 = _2725.z;
    float _2733 = -_2089;
    float _2735 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1891);
    float _2737 = _1773 * 3.883221149444580078125;
    float _2739 = -_2091;
    float _2741 = fma(_2739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1893);
    float _2743 = -_2113;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1899);
    float _2747 = _2735 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2749 = _2737 * 0.15915493667125701904296875;
    float _2751 = _1805 * _1861;
    bool _2753 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2755 = isnan(0.5);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2761 = _2757 || _2759;
    float _2763 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2747);
    float _2765 = _1789 * 2.0;
    float _2767 = _2749 * 6.283185482025146484375;
    float _2769 = cos(_2767);
    float _2771 = -_1575;
    float _2773 = _2771 + _1775;
    float _2775 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2763);
    float _2777 = -_2765;
    float _2779 = fma(_2751, _2777, _2751);
    float _2781 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2783 = fma(_1721, _2773, _1575);
    float _2785 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2787 = _2735 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2789 = fma(_1789, 3.1415927410125732421875, _2779);
    float _2791 = _2749 * 6.283185482025146484375;
    float _2793 = sin(_2791);
    if (!_2761)
    {
        _2345 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2795 = _2345;
    float _2797 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2787);
    float _2799 = _2789 * 0.15915493667125701904296875;
    float _2801 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2783);
    out.m_63.x = _1603;
    out.m_63.y = _1601;
    out.m_63.z = _1611;
    out.m_63.w = _1557;
    float _2803 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2797);
    float _2805 = 1.0 / _2785;
    out.m_65.x = _642;
    out.m_65.y = _644;
    out.m_65.z = _648;
    out.m_65.w = _636;
    float _2807 = _2803 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_67.x = _1605;
    out.m_67.y = _1595;
    out.m_67.z = _1569;
    out.m_67.w = _1553;
    float _2809 = _2807 + _2785;
    float _2811 = _2799 * 6.283185482025146484375;
    float _2813 = sin(_2811);
    out.m_69.y = _2209;
    float _2815 = -_2801;
    float _2817 = _2237 * _2815;
    out.m_71.x = _2407;
    out.m_71.y = _2403;
    out.m_71.z = _2411;
    float _2819 = _2247 * _2801;
    float _2821 = _2809 * _2805;
    float _2823 = _2821 * 0.5;
    float _2825 = exp2(_2781);
    float _2827 = _2239 * _2801;
    float _2829 = _2823;
    float _2831 = _2795;
    float _2833 = _2805;
    if (_2761)
    {
        _2347 = 1.0;
    }
    float _2835 = _2347;
    float _2837 = _2835;
    if (!_2761)
    {
        float _2839 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2841 = fma(_2823, _2795, _2839);
        _2829 = _2841;
    }
    float _2843 = _2829;
    if (!_2761)
    {
        _2831 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2845 = _2831;
    float _2847 = -_1727;
    float _2849 = fma(_2813, _2769, _2847);
    float _2851 = -_1729;
    float _2853 = fma(_2813, _2793, _2851);
    float _2855 = _2843;
    if (!_2761)
    {
        float _2857 = 1.0 / _2843;
        _2855 = _2857;
    }
    float _2859 = _2855;
    if (!_2761)
    {
        float _2861 = -_2845;
        float _2863 = _2861 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2833 = _2863;
    }
    float _2865 = _2833;
    float _2867 = fma(_1721, _2849, _1727);
    float _2869 = fma(_1721, _2853, _1729);
    float _2871 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2867);
    float _2873 = fma(_1755, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2869);
    float _2875 = _2865;
    if (!_2761)
    {
        float _2877 = 1.0 / _2865;
        _2875 = _2877;
    }
    float _2879 = _2875;
    float _2881 = -_2825;
    float _2883 = _2881 + 1.0;
    float _2885 = fma(_2241, _2871, _2817);
    float _2887 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2889 = fma(_2259, _2871, _2819);
    float _2891 = fma(_2273, _2871, _2827);
    float _2893 = fma(_2253, _2873, _2885);
    float _2895 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2887);
    float _2897 = fma(_2263, _2873, _2889);
    float _2899 = _2859;
    if (!_2761)
    {
        float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2903 = -_2845;
        float _2905 = fma(_2859, _2901, _2903);
        _2899 = _2905;
    }
    float _2907 = _2899;
    float _2909 = fma(_2281, _2873, _2891);
    float _2911 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2895);
    float _2913 = _2897 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2915 = _2897 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2917 = _2897 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2919 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2911);
    float _2921 = fma(_2893, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2913);
    float _2923 = fma(_2893, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2915);
    float _2925 = fma(_2893, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2917);
    float _2927 = _2907;
    if (!_2761)
    {
        float _2929 = _2907 * _2879;
        float _2931 = precise::clamp(_2929, 0.0, 1.0);
        _2927 = _2931;
    }
    float _2933 = _2927;
    float _2935 = fma(_2909, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2921);
    float _2937 = fma(_2909, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2923);
    float _2939 = fma(_2909, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2925);
    float _2941 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2761)
    {
        float _2943 = -_2933;
        float _2945 = _2943 + 1.0;
        _2837 = _2945;
    }
    float _2947 = _2837;
    float _2949 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2951 = _2919 + _2949;
    out.m_73.x = _2937;
    out.m_73.y = _2935;
    out.m_73.z = _2939;
    float _2953 = _2947 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2955 = _2947 > 0.0;
    bool _2957 = isnan(_2947);
    bool _2959 = _2955 || _2957;
    bool _2961 = isnan(0.0);
    bool _2963 = _2959 || _2961;
    float _2965 = _2651 + _2951;
    float _2967 = _371 * _2953;
    float _2969 = _2965 * 0.5;
    float _2971 = _2967 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2673;
    out.gl_Position.y = _2689;
    out.gl_Position.z = _2951;
    out.gl_Position.w = _2651;
    float _2973 = -_2941;
    float _2975 = _2973 + 1.0;
    out.m_75.z = _2969;
    out.m_75.w = _2651;
    out.m_47.x = _2971;
    float _2977 = _2941 * _2705;
    float _2979 = _2721 * _2977;
    float _2981 = _2721 * _2975;
    float _2983 = _2731 * _2977;
    float _2985 = fma(_2727, _2979, _2715);
    float _2987 = fma(_2729, _2979, _2717);
    float _2989 = fma(_2721, _2983, _2719);
    out.m_77.x = _2985;
    out.m_77.y = _2987;
    out.m_77.z = _2989;
    out.m_77.w = _2981;
    if (_2963)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2991 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2991;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1837 = false;
    bool _1645 = false;
    bool _668 = false;
    bool _527 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _101 = int(_99);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3048 = as_type<float>(_117);
        out.gl_Position.z = _3048;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_49.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = _135;
    if (_131)
    {
        float _139 = float(_101);
        _111 = _139;
    }
    float _141 = _111;
    bool _143 = _135 >= _141;
    bool _145 = !_131;
    bool _147 = _143 || _145;
    float _149 = _141;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _149;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3118 = as_type<float>(_155);
        out.gl_Position.z = _3118;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = in.m_51.x;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = in.m_53.y;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _161 * _159;
    float _183 = 0.0;
    if (!_175)
    {
        float _185 = _165 * _165;
        float _187 = _185 * 0.5;
        _183 = _187;
    }
    float _189 = _183;
    float _191 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _193 = _189;
    if (!_175)
    {
        float _195 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = in.m_49.x;
    float _201 = in.m_49.y;
    float _203 = in.m_49.z;
    float _205 = _191 * 6.283185482025146484375;
    float _207 = floor(_191);
    float _209 = _205 * 0.15915493667125701904296875;
    float _211 = _209 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = -_207;
    float _217 = _191 + _215;
    float _219 = _207;
    float _221 = _197;
    if (!_175)
    {
        _219 = _165;
    }
    float _223 = _219;
    bool _225 = !_175;
    float _227 = _223;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _165 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _165);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _257;
    }
    float _259 = _221;
    bool _261 = !_175;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _165 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _227 = _281;
    }
    float _283 = _227;
    float _285 = in.m_55.w;
    float _287 = in.m_44.x;
    float _289 = in.m_44.y;
    float _291 = in.m_44.z;
    bool _293 = _217 < 0.5;
    float _295 = float(_293);
    float _297 = -_217;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _303 = _301 != 0;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _307 = _305 != 0;
    float _309 = fma(_213, 0.5, 0.5);
    float _311 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_57.y = _163;
    bool _317 = !_303;
    int _319 = _317 ? 0 : 1;
    float _321 = -_309;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = fma(_283, _199, _311);
    bool _327 = !_307;
    int _329 = _327 ? 0 : 1;
    float _331 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _333 = !_179;
    int _335 = _333 ? 0 : 1;
    float _337 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _339 = abs(_319);
    float _341 = fma(_283, _201, _331);
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_283, _203, _337);
    int _347 = abs(_329);
    int _349 = abs(_335);
    float _351 = float(_339);
    float _353 = fma(_325, _285, _287);
    float _355 = float(_349);
    float _357 = fma(_341, _285, _289);
    float _359 = float(_347);
    float _361 = abs(_299);
    float _363 = _351 * _361;
    float _365 = fma(_345, _285, _291);
    float _367 = fma(_355, _323, _363);
    float _369 = abs(_315);
    float _371 = fma(_359, _369, _367);
    bool _373 = !_343;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_101);
        float _395 = 1.0 / _393;
        float _397 = _135 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = in.m_55.x;
    float _407 = in.m_55.y;
    float _409 = in.m_55.z;
    bool _411 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _413 = isnan(_399);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _423;
    bool _427 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_399);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _441 = 1.0 / _425;
    float _443 = -_437;
    float _445 = _443 + 1.0;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _403 * _441;
    float _455 = fma(_451, _453, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _461;
    float _465 = _439 * _157;
    float _467 = _421 * _445;
    float _469 = fma(_459, _453, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = fma(_463, _453, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _473 = -_421;
    float _475 = _473 + 1.0;
    float _477 = _455 * _467;
    float _479 = trunc(_465);
    int _481 = int(_479);
    float _483 = _469 * _467;
    float _485 = _471 * _467;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _477);
    float _489 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].z, _485);
    float _493 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].x, _487);
    float _495 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].y, _489);
    float _497 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[144].z, _491);
    float _499 = _493 * _405;
    float _501 = _495 * _407;
    float _503 = _497 * _409;
    int _505 = _481 << 4;
    int _507 = _505 + 1712;
    bool _509 = !_447;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_101);
        float _531 = 1.0 / _529;
        float _533 = _135 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    uint _538 = uint(int(uint(_507) >> uint(2)));
    uint _540 = uint(int(uint(int(_538)) >> uint(2)));
    int _542 = int(_538) & 3;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[int(_540)][_542];
    int _546 = int(_538) + 1;
    uint _548 = uint(int(uint(_546) >> uint(2)));
    int _550 = _546 & 3;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[int(_548)][_550];
    bool _554 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_535);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _572 = _507 + 8;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    uint _576 = uint(int(uint(int(_574)) >> uint(2)));
    int _578 = int(_574) & 3;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[int(_576)][_578];
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = 1.0 / _568;
    float _588 = -_564;
    float _590 = _588 + 1.0;
    float _592 = _570 * _157;
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _596 = _584 * _586;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _535 + _598;
    bool _602 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _604 = isnan(_535);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_596, _600, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _616 = _612 * _590;
    float _618 = -_612;
    float _620 = _618 + 1.0;
    float _622 = trunc(_592);
    int _624 = int(_622);
    float _626 = _614 * _616;
    float _628 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _626);
    float _630 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[116].x, _628);
    float _632 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _634 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _636 = _630 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _638 = _624 << 4;
    int _640 = _638 + 1968;
    float _642 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _650 = !_594;
    float _666;
    if (!_650)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _654 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_101);
        float _672 = 1.0 / _670;
        float _674 = _135 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    int _678 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _680 = _678;
    int _682 = 0;
    int _684 = _92(_680, _682, (*spvDescriptorSet0.support_buffer));
    float _686 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _688 = int(_686);
    float _690 = fma(_135, 0.01200000010430812835693359375, _157);
    float _692 = in.m_53.z;
    float _694 = in.m_51.y;
    float _696 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _698 = int(_696);
    float _700 = float(_688);
    float _702 = floor(_690);
    float _704 = float(uint(_698));
    float _706 = 1.0 / _700;
    float _708 = 1.0 / _704;
    float _710 = _135 * _706;
    float _712 = trunc(_692);
    int _714 = int(_712);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _718 = _716 != 0;
    int _720 = as_type<int>(_708) + (-2);
    float _722 = trunc(_710);
    int _724 = int(_722);
    int _726 = ~_698;
    int _728 = _726 + 1;
    float _730 = float(uint(_724));
    float _732 = as_type<float>(_720) * _730;
    float _734 = fma(_702, 0.20000000298023223876953125, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = trunc(_732);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    int _744 = _728 * int(_742);
    int _746 = _744 + _724;
    float _748 = float(uint(_746));
    float _750 = as_type<float>(_720) * _748;
    float _752 = _694 * 1.2345600128173828125;
    bool _754 = !_718;
    float _756 = _754 ? _752 : _157;
    float _758 = trunc(_750);
    float _760 = precise::max(_758, 0.0);
    uint _762 = uint(_760);
    int _764 = _684 + (-1);
    float _766 = float(_764);
    float _768 = _736 * _766;
    float _770 = trunc(_768);
    int _772 = int(_770);
    int _774 = _772;
    int _776 = 0;
    int _778 = _93(_774, _776, (*spvDescriptorSet0.support_buffer));
    int _780 = _714;
    int _782 = 0;
    int _784 = _93(_780, _782, (*spvDescriptorSet0.support_buffer));
    float4 _787 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_778, _784)), 0).xyzw;
    float _789 = _787.x;
    float _791 = _787.y;
    float _793 = _787.z;
    float _795 = _787.w;
    int _797 = ~_698;
    int _799 = _797 + 1;
    float _801 = floor(_756);
    int _803 = int(_742) + int(_762);
    float _805 = float(_698);
    float _807 = float(_724);
    int _809 = _799 * _803;
    int _811 = _809 + _724;
    float _813 = float(_101);
    bool _815 = _807 >= _805;
    bool _817 = isnan(_807);
    bool _819 = _815 || _817;
    bool _821 = isnan(_805);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    bool _827 = uint(_811) >= uint(_698);
    float _829 = 1.0 / _813;
    bool _831 = _698 == 0;
    bool _833 = !_827;
    int _835 = _833 ? 0 : (-1);
    float _837 = -_801;
    float _839 = _756 + _837;
    int _841 = ~_803;
    int _843 = _841 + _835;
    int _845 = _843 + 1;
    float _847 = trunc(_825);
    int _849 = int(_847);
    float _851 = _839 * _805;
    float _853 = _135 * _805;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _865 = _863 != 0;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _869 = _867 != 0;
    int _871 = _698 * _845;
    int _873 = _871 + _724;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _877 = _875 != 0;
    int _879 = _698 + (-1);
    float _881 = _853 * _829;
    bool _883 = !_831;
    int _885 = _883 ? _873 : (-1);
    float _887 = trunc(_851);
    int _889 = int(_887);
    bool _891 = !_861;
    int _893 = _891 ? 0 : 1;
    bool _895 = !_857;
    int _897 = _895 ? 0 : 1;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _901 = _899 != 0;
    int _903 = ~_849;
    int _905 = _903 + 1;
    int _907 = _905 + 1;
    float _909 = trunc(_881);
    int _911 = int(_909);
    int _913 = ~_698;
    int _915 = _913 + 1;
    int _917 = _885 * _907;
    bool _919 = !_877;
    int _921 = _919 ? 0 : 1;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    int _927 = _849 * _879;
    int _929 = _927 + _917;
    int _931 = abs(_893);
    int _933 = abs(_921);
    bool _935 = !_865;
    int _937 = _935 ? 0 : 1;
    int _939 = _929 * _931;
    int _941 = abs(_897);
    int _943 = _889 * _933;
    int _945 = _943 + _724;
    bool _947 = !_869;
    int _949 = _947 ? 0 : 1;
    float _951 = in.m_53.x;
    int _953 = abs(_937);
    int _955 = abs(_949);
    int _957 = _911 * _941;
    int _959 = _957 + _939;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _963 = _961 != 0;
    int _965 = _945 * _953;
    int _967 = _965 + _959;
    int _969 = ~_698;
    int _971 = _969 + 1;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _975 = _973 != 0;
    int _977 = _889 * _955;
    int _979 = _977 + _967;
    float _981 = float(uint(_945));
    float _983 = float(uint(_979));
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _987 = ~_698;
    int _989 = _987 + 1;
    float _991 = as_type<float>(_720) * _981;
    float _993 = as_type<float>(_720) * _983;
    int _995 = ~_698;
    int _997 = _995 + 1;
    float _999 = trunc(_991);
    float _1001 = precise::max(_999, 0.0);
    uint _1003 = uint(_1001);
    float _1005 = trunc(_993);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    int _1011 = _997 * int(_1009);
    int _1013 = _1011 + _979;
    float _1015 = float(uint(_1013));
    float _1017 = as_type<float>(_720) * _1015;
    float _1019 = in.m_51.w;
    float _1021 = trunc(_1017);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    float _1027 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1029 = int(_1009) + int(_1025);
    float _1031 = as_type<float>(_971);
    float _1033 = as_type<float>(_979);
    float _1035 = _951;
    if (_963)
    {
        float _1037 = in.m_51.z;
        _1031 = _1037;
    }
    float _1039 = _1031;
    bool _1041 = _1019 > 0.5;
    bool _1043 = _1041 && _901;
    int _1045 = _971 * _1029;
    int _1047 = _1045 + _979;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1053 = uint(_1047) >= uint(_698);
    float _1055 = 1.0 / _1051;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1059 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1061 = !_1053;
    int _1063 = _1061 ? 0 : (-1);
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1067 = _1065 != 0;
    float _1069 = fma(_1059, -2.0, _985);
    float _1071 = -_1057;
    float _1073 = fma(_1027, 2.0, _1071);
    int _1075 = ~_1029;
    int _1077 = _1075 + _1063;
    int _1079 = _1077 + 1;
    float _1081 = -_163;
    float _1083 = _1081 + 1.0;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1085;
    bool _1089 = _694 > 0.5;
    bool _1091 = _1089 && _1067;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1095 = _698 * _1079;
    int _1097 = _1095 + _979;
    float _1099 = _1087 * _1055;
    float _1101 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1069);
    float _1103 = _1043 ? _1083 : _163;
    float _1105 = -_135;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1073);
    float _1109 = _1091 ? _1083 : _163;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1113 = _1043;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    bool _1117 = _1091;
    float _1119 = _1109;
    if (_963)
    {
        bool _1121 = _1039 > 0.5;
        _1113 = _1121;
    }
    bool _1123 = _1113;
    float _1125 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1127 = _1039;
    if (!_718)
    {
        float _1129 = in.m_51.z;
        _1127 = _1129;
    }
    float _1131 = _1127;
    bool _1133 = !_831;
    int _1135 = _1133 ? _1097 : (-1);
    float _1137 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1111);
    if (!_718)
    {
        _1115 = _694;
    }
    float _1139 = _1115;
    float _1141 = _1139;
    if (_925)
    {
        bool _1143 = _157 > 0.5;
        _1117 = _1143;
    }
    bool _1145 = _1117;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (_718)
    {
        _1141 = _157;
    }
    float _1149 = _1141;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1153 = _676 + _1151;
    int _1155 = _1135 >> 31;
    if (!_925)
    {
        _1033 = _951;
    }
    float _1157 = _1033;
    float _1159 = fma(_1099, _1153, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1161 = _1155 & 3;
    float _1163 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1165 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1147);
    float _1167 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1169 = _1135 + _1161;
    float _1171 = fma(_1163, _1109, -0.5);
    float _1173 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1165);
    int _1175 = _915 * int(_1003);
    int _1177 = _1175 + _945;
    int _1179 = _1169 >> 2;
    int _1181 = as_type<int>(_1163);
    float _1183 = _1157;
    int _1185 = as_type<int>(_1167);
    if (_925)
    {
        float _1187 = -_951;
        float _1189 = _1187 + 1.0;
        _1181 = as_type<int>(_1189);
    }
    int _1191 = _1181;
    float _1193 = _1131;
    if (!_718)
    {
        _1119 = _1131;
    }
    float _1195 = _1119;
    int _1197 = _1179 << 4;
    int _1199 = _1197 + 512;
    float _1201 = float(uint(_1177));
    float _1203 = _1195;
    if (_925)
    {
        float _1205 = _1145 ? as_type<float>(_1191) : _951;
        _1183 = _1205;
    }
    float _1207 = _1183;
    if (_718)
    {
        _1203 = _694;
    }
    float _1209 = _1203;
    uint _1211 = uint(int(uint(_1199) >> uint(2)));
    uint _1213 = uint(int(uint(int(_1211)) >> uint(2)));
    int _1215 = int(_1211) & 3;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[int(_1213)][_1215];
    int _1219 = int(_1211) + 1;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    int _1223 = _1219 & 3;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[int(_1221)][_1223];
    if (_718)
    {
        _1193 = _694;
    }
    float _1227 = _1193;
    float _1229 = -_1101;
    float _1231 = fma(_1173, _1171, _1229);
    float _1233 = as_type<float>(_720) * _1201;
    bool _1235 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1237 = isnan(_676);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1243 = _1239 || _1241;
    float _1245 = float(_1243);
    float _1247 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1249 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1251 = isnan(_676);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = trunc(_1233);
    float _1263 = precise::max(_1261, 0.0);
    uint _1265 = uint(_1263);
    float _1267 = -_1245;
    float _1269 = _1267 + 1.0;
    int _1271 = _1135 & 3;
    bool _1273 = _1271 != 0;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1277 = _1259 * _1269;
    int _1279 = _1135 & 3;
    bool _1281 = _1279 != 0;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1285 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1275);
    int _1287 = _1273 ? 0 : 1;
    int _1289 = _1199 + 8;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    bool _1307 = uint(_1279) > 1u;
    float _1309 = _1159 * _1277;
    float _1311 = -_1283;
    float _1313 = fma(_1167, 2.0, _1311);
    if (_963)
    {
        float _1315 = -_951;
        float _1317 = _1315 + 1.0;
        _1185 = as_type<int>(_1317);
    }
    int _1319 = _1185;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1323 = int(_1003) + int(_1265);
    float _1325 = -_135;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1313);
    float _1329 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1321);
    if (_963)
    {
        float _1331 = _1123 ? as_type<float>(_1319) : _951;
        _1035 = _1331;
    }
    float _1333 = _1035;
    float _1335 = -_1259;
    float _1337 = _1335 + 1.0;
    bool _1339 = _1279 != 3;
    int _1341 = _989 * _1323;
    int _1343 = _1341 + _945;
    int _1345 = ~_1287;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    float _1351 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1309);
    int _1353 = _1349;
    if (!_1307)
    {
        int _1355 = ~_1287;
        int _1357 = _1355 + 1;
        _1353 = _1357;
    }
    int _1359 = _1353;
    float _1361 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _1363 = uint(_1279) >= 2u;
    float _1365 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1351);
    int _1367 = abs(_1359);
    bool _1369 = uint(_1343) >= uint(_698);
    int _1371 = _1363 ? 0 : 1;
    bool _1373 = !_1281;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = ~_1367;
    int _1379 = _1377 + 1;
    int _1381 = _1379 + 1;
    bool _1383 = !_1369;
    int _1385 = _1383 ? 0 : (-1);
    int _1387 = ~_1371;
    int _1389 = _1387 + 1;
    int _1391 = _1389 + 1;
    bool _1393 = _1279 != 3;
    int _1395 = _1391;
    if (_1339)
    {
        int _1397 = ~_1371;
        int _1399 = _1397 + 1;
        _1395 = _1399;
    }
    int _1401 = _1395;
    int _1403 = _1381 * as_type<int>(_1225);
    int _1405 = abs(_1375);
    float _1407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1409 = ~_1323;
    int _1411 = _1409 + _1385;
    int _1413 = _1411 + 1;
    bool _1415 = !_1393;
    int _1417 = _1415 ? 0 : (-1);
    int _1419 = abs(_1401);
    int _1421 = _698 * _1413;
    int _1423 = _1421 + _945;
    int _1425 = ~_1405;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    int _1431 = _640 + 8;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    uint _1435 = uint(int(uint(int(_1433)) >> uint(2)));
    int _1437 = int(_1433) & 3;
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[int(_1435)][_1437];
    bool _1441 = !_975;
    int _1443 = _1441 ? 0 : 1;
    int _1445 = abs(_1417);
    int _1447 = _1429 * as_type<int>(_1217);
    int _1449 = _1447 + _1403;
    int _1451 = abs(_1443);
    int _1453 = ~_1419;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1461 = ~_1445;
    int _1463 = _1461 + 1;
    int _1465 = _1463 + 1;
    int _1467 = _1457 * as_type<int>(_1297);
    int _1469 = _1467 + _1449;
    int _1471 = ~_1451;
    int _1473 = _1471 + 1;
    int _1475 = _1473 + 1;
    float _1477 = fma(_1247, -2.0, _1459);
    int _1479 = _1465 * as_type<int>(_1305);
    int _1481 = _1479 + _1469;
    float _1483 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1485 = !_831;
    int _1487 = _1485 ? _1423 : (-1);
    float _1489 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1285);
    int _1491 = _1481 * _1475;
    float _1493 = fma(_1483, _1207, -0.5);
    uint _1495 = as_type<uint>(half2(float2(_795, 0.0)));
    float _1497 = fma(_1489, _1361, _1327);
    int _1499 = _1487 * _1451;
    int _1501 = _1499 + _1491;
    float _1503 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1137);
    uint _1505 = extract_bits(_1495, 0u, 8u);
    int _1507 = int(_1505) & 255;
    uint _1509 = extract_bits(_1495, 8u, 8u);
    int _1511 = int(_1509) & 255;
    int _1513 = _1511 << 8;
    int _1515 = _1507 | _1513;
    float _1517 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1329);
    float _1519 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1477);
    float _1521 = float(_1501);
    float _1523 = fma(_1503, _1493, _1107);
    bool _1525 = _1515 >= 32768;
    uint _1527 = uint(int(uint(_640) >> uint(2)));
    uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
    int _1531 = int(_1527) & 3;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[int(_1529)][_1531];
    int _1535 = int(_1527) + 1;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    int _1539 = _1535 & 3;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[int(_1537)][_1539];
    int _1543 = _772 + 1;
    out.m_59.y = _1521;
    float _1545 = -_1519;
    float _1547 = fma(_1517, _1125, _1545);
    int _1549 = min(_764, _1543);
    int _1551 = _1515 + (-1024);
    float _1553 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1555 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1557 = _1547 + 0.5;
    int _1559 = _1551;
    if (_1525)
    {
        int _1561 = ~_1515;
        int _1563 = _1561 + 33792;
        int _1565 = _1563 + 1;
        _1559 = _1565;
    }
    int _1567 = _1559;
    float _1569 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1571 = _1567 + 30719;
    float _1573 = float(_1571);
    float _1575 = fma(_1573, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1577 = abs(_1575);
    float _1579 = -_1577;
    float _1581 = _1579 + 1.0;
    bool _1583 = _1575 < 0.0;
    float _1585 = float(_1583);
    int _1587 = as_type<int>(_1581) + (-218103808);
    bool _1589 = uint(_1587) >= 1920991232u;
    float _1591 = _1541 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1593 = _1533 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1595 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1597 = abs(_1575);
    float _1599 = fma(_1597, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1601 = _1231 + 0.5;
    float _1603 = _1523 + 0.5;
    float _1605 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1607 = abs(_1575);
    float _1609 = fma(_1607, _1599, -0.212114393711090087890625);
    float _1611 = _1497 + 0.5;
    float _1613 = abs(_1575);
    float _1615 = fma(_1613, _1609, 1.570728778839111328125);
    bool _1617 = !_1589;
    float _1643;
    if (!_1617)
    {
        int _1619 = as_type<int>(_1581);
        int _1621 = as_type<int>(_1207);
        int _1623 = 7712;
        int _1625 = as_type<int>(_1581);
        int _1627 = _1449;
        int _1629;
        int _1631;
        int _1633;
        int _1635;
        int _1637;
        int _1639;
        int _1641;
        _90(_1619, _1621, _1623, _1625, _1627, _1629, _1631, _1633, _1635, _1637, _1639, _1641, out.gl_Position, out.gl_PointSize);
        _1643 = as_type<float>(_1639);
        _1645 = true;
    }
    else
    {
        float _1647 = rsqrt(_1581);
        float _1649 = _1581 * _1647;
        float _1651 = _1647 * 0.5;
        float _1653 = -_1649;
        float _1655 = 0.0 + _1653;
        float _1657 = fma(_1651, _1655, 0.5);
        float _1659 = fma(_1649, _1657, _1649);
        float _1661 = -_1659;
        float _1663 = 0.0 + _1661;
        float _1665 = fma(_1659, _1663, _1581);
        float _1667 = fma(_1651, _1665, _1659);
        _1643 = _1667;
    }
    _1645 = false;
    float _1669 = _1643;
    int _1671 = _1549;
    int _1673 = 0;
    int _1675 = _93(_1671, _1673, (*spvDescriptorSet0.support_buffer));
    int _1677 = _714;
    int _1679 = 0;
    int _1681 = _93(_1677, _1679, (*spvDescriptorSet0.support_buffer));
    float4 _1683 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1675, _1681)), 0).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float _1693 = _1615 * _1669;
    float _1695 = _1585 * 2.0;
    float _1697 = _1573 * 3.883221149444580078125;
    float _1699 = floor(_768);
    float _1701 = -_1695;
    float _1703 = fma(_1693, _1701, _1693);
    float _1705 = _1697 * 0.15915493667125701904296875;
    float _1707 = fma(_1585, 3.1415927410125732421875, _1703);
    float _1709 = _1705 * 6.283185482025146484375;
    float _1711 = cos(_1709);
    float _1713 = _1707 * 0.15915493667125701904296875;
    float _1715 = _1713 * 6.283185482025146484375;
    float _1717 = sin(_1715);
    float _1719 = -_1699;
    float _1721 = _768 + _1719;
    float _1723 = _1705 * 6.283185482025146484375;
    float _1725 = sin(_1723);
    float _1727 = _1717 * _1711;
    float _1729 = _1717 * _1725;
    uint _1731 = as_type<uint>(half2(float2(_1691, 0.0)));
    float _1733 = -_789;
    float _1735 = _1733 + _1685;
    float _1737 = -_793;
    float _1739 = _1737 + _1689;
    uint _1741 = extract_bits(_1731, 0u, 8u);
    int _1743 = int(_1741) & 255;
    uint _1745 = extract_bits(_1731, 8u, 8u);
    int _1747 = int(_1745) & 255;
    int _1749 = _1747 << 8;
    int _1751 = _1743 | _1749;
    float _1753 = fma(_1721, _1735, _789);
    float _1755 = fma(_1721, _1739, _793);
    bool _1757 = _1751 >= 32768;
    int _1759 = _1751 + (-1024);
    int _1761 = _1759;
    if (_1757)
    {
        int _1763 = ~_1751;
        int _1765 = _1763 + 33792;
        int _1767 = _1765 + 1;
        _1761 = _1767;
    }
    int _1769 = _1761;
    int _1771 = _1769 + 30719;
    float _1773 = float(_1771);
    float _1775 = fma(_1773, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1777 = abs(_1775);
    float _1779 = -_1777;
    float _1781 = _1779 + 1.0;
    float _1783 = abs(_1775);
    float _1785 = fma(_1783, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1787 = _1775 < 0.0;
    float _1789 = float(_1787);
    int _1791 = as_type<int>(_1781) + (-218103808);
    float _1793 = abs(_1775);
    float _1795 = fma(_1793, _1785, -0.212114393711090087890625);
    bool _1797 = uint(_1791) >= 1920991232u;
    float _1799 = -_791;
    float _1801 = _1799 + _1687;
    float _1803 = abs(_1775);
    float _1805 = fma(_1803, _1795, 1.570728778839111328125);
    float _1807 = fma(_1721, _1801, _791);
    bool _1809 = !_1797;
    float _1835;
    if (!_1809)
    {
        int _1811 = as_type<int>(_1781);
        int _1813 = as_type<int>(_1687);
        int _1815 = 8608;
        int _1817 = as_type<int>(_1699);
        int _1819 = as_type<int>(_1669);
        int _1821;
        int _1823;
        int _1825;
        int _1827;
        int _1829;
        int _1831;
        int _1833;
        _90(_1811, _1813, _1815, _1817, _1819, _1821, _1823, _1825, _1827, _1829, _1831, _1833, out.gl_Position, out.gl_PointSize);
        _1835 = as_type<float>(_1831);
        _1837 = true;
    }
    else
    {
        float _1839 = rsqrt(_1781);
        float _1841 = _1781 * _1839;
        float _1843 = _1839 * 0.5;
        float _1845 = -_1841;
        float _1847 = 0.0 + _1845;
        float _1849 = fma(_1843, _1847, 0.5);
        float _1851 = fma(_1841, _1849, _1841);
        float _1853 = -_1851;
        float _1855 = 0.0 + _1853;
        float _1857 = fma(_1851, _1855, _1781);
        float _1859 = fma(_1843, _1857, _1851);
        _1835 = _1859;
    }
    _1837 = false;
    float _1861 = _1835;
    float _1863 = in.m_51.x;
    float _1865 = in.m_51.y;
    float _1867 = in.m_51.z;
    float _1869 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1871 = log2(_1869);
    float _1873 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1875 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1877 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1879 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1873);
    float _1881 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1875);
    float _1883 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1877);
    float _1885 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1879);
    float _1887 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1881);
    float _1889 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1883);
    float _1891 = _1885 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1893 = _1887 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1895 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1897 = _1871 * _135;
    float _1899 = _1889 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1903 = _1893 + _1901;
    float _1905 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1907 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1909 = exp2(_1897);
    float _1911 = _1863 * 2.0;
    float _1913 = _1867 * 2.0;
    float _1915 = _1865 * 2.0;
    float _1917 = floor(_1911);
    float _1919 = floor(_1913);
    float _1921 = floor(_1915);
    bool _1923 = _1917 > 0.0;
    bool _1925 = _1917 >= 0.0;
    bool _1927 = isnan(_1917);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(0.0);
    bool _1933 = _1929 || _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1937 = _1891 + _1935;
    int _1939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1941 = _1939 != 0;
    int _1943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1945 = _1943 != 0;
    int _1947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1949 = _1947 != 0;
    float _1951 = _1937 * _1937;
    bool _1953 = _1919 >= 0.0;
    bool _1955 = isnan(_1919);
    bool _1957 = _1953 || _1955;
    bool _1959 = isnan(0.0);
    bool _1961 = _1957 || _1959;
    float _1963 = _1865 + _1867;
    int _1965 = _1933 ? 0 : 1;
    float _1967 = fma(_1903, _1903, _1951);
    int _1969 = _1961 ? 0 : 1;
    float _1971 = _1963 + (-1.0);
    bool _1973 = _1919 > 0.0;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1977 = _1899 + _1975;
    bool _1979 = _1921 > 0.0;
    bool _1981 = _1921 >= 0.0;
    bool _1983 = isnan(_1921);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(0.0);
    bool _1989 = _1985 || _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1993 = 1.0 + _1991;
    int _1995 = ~_1965;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    float _2001 = fma(_1977, _1977, _1967);
    int _2003 = _1999;
    if (!_1923)
    {
        int _2005 = ~_1965;
        int _2007 = _2005 + 1;
        _2003 = _2007;
    }
    int _2009 = _2003;
    float _2011 = in.m_61.x;
    float _2013 = in.m_61.y;
    float _2015 = in.m_61.z;
    float _2017 = 1.0 / _1993;
    bool _2019 = !_1945;
    int _2021 = _2019 ? 0 : 1;
    bool _2023 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2025 = isnan(1.0);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2031 = _2027 || _2029;
    int _2033 = abs(_2021);
    float _2035 = -_1909;
    float _2037 = _2035 + 1.0;
    bool _2039 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2041 = isnan(0.0);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2047 = _2043 || _2045;
    float _2049 = rsqrt(_2001);
    float _2051 = float(_2033);
    float _2053 = _2047 ? _2037 : 0.0;
    float _2055 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2057 = float(_2009);
    int _2059 = ~_1969;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    int _2065 = _2063;
    if (_2031)
    {
        float _2067 = _2053 * _2017;
        _137 = _2067;
    }
    float _2069 = _137;
    bool _2071 = !_1941;
    int _2073 = _2071 ? 0 : 1;
    float _2075 = _2051 * _2057;
    if (!_1973)
    {
        int _2077 = ~_1969;
        int _2079 = _2077 + 1;
        _2065 = _2079;
    }
    int _2081 = _2065;
    int _2083 = abs(_2073);
    float _2085 = _2075 * (-2.0);
    int _2087 = _1989 ? 0 : 1;
    float _2089 = _1937 * _2049;
    float _2091 = _1903 * _2049;
    float _2093 = fma(_2055, _2085, _2055);
    float _2095 = fma(_2085, _2013, _2013);
    float _2097 = -_2089;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1937);
    float _2101 = -_2091;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1903);
    float _2105 = _1865 + (-0.5);
    float _2107 = float(_2083);
    float _2109 = _2099 * _2099;
    float _2111 = float(_2081);
    float _2113 = _1977 * _2049;
    float _2115 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2095);
    float _2117 = fma(_2103, _2103, _2109);
    bool _2119 = !_1949;
    int _2121 = _2119 ? 0 : 1;
    float _2123 = _2107 * _2111;
    int _2125 = ~_2087;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    float _2131 = -_2113;
    float _2133 = fma(_2131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1977);
    int _2135 = _2129;
    if (!_1979)
    {
        int _2137 = ~_2087;
        int _2139 = _2137 + 1;
        _2135 = _2139;
    }
    int _2141 = _2135;
    float _2143 = _1865 + _1863;
    int _2145 = abs(_2121);
    float _2147 = _1863 + _1867;
    float _2149 = float(_2141);
    float _2151 = fma(_2133, _2133, _2117);
    float _2153 = float(_2145);
    float _2155 = _2147 + (-1.0);
    float _2157 = _2143 + (-1.0);
    float _2159 = fma(_2093, _2069, _2115);
    float _2161 = _2153 * _2149;
    float _2163 = fma(_2157, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2165 = _2123 * (-2.0);
    float _2167 = _2161 * (-2.0);
    float _2169 = _2159 * 0.15915493667125701904296875;
    float _2171 = fma(_2155, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2173 = fma(_2165, _2011, _2011);
    float _2175 = fma(_2163, _2165, _2163);
    float _2177 = _1863 + (-0.5);
    float _2179 = _1867 + (-0.5);
    float _2181 = fma(_2167, _2015, _2015);
    float _2183 = fma(_2171, _2167, _2171);
    float _2185 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2173);
    float _2187 = sqrt(_2151);
    float _2189 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2181);
    float _2191 = fma(_2175, _2069, _2185);
    float _2193 = fma(_2183, _2069, _2189);
    float _2195 = _2191 * 0.15915493667125701904296875;
    float _2197 = _2169 * 6.283185482025146484375;
    float _2199 = sin(_2197);
    float _2201 = _2193 * 0.15915493667125701904296875;
    float _2203 = _2169 * 6.283185482025146484375;
    float _2205 = cos(_2203);
    float _2207 = _2049 * _2187;
    float _2209 = _1895 * _2207;
    float _2211 = _1905 * _2207;
    float _2213 = _1907 * _2207;
    float _2215 = _2195 * 6.283185482025146484375;
    float _2217 = sin(_2215);
    float _2219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1755);
    float _2221 = _2213 * _2219;
    float _2223 = _2201 * 6.283185482025146484375;
    float _2225 = cos(_2223);
    float _2227 = _2195 * 6.283185482025146484375;
    float _2229 = cos(_2227);
    float _2231 = _2217 * _2199;
    float _2233 = _2217 * _2205;
    float _2235 = _2201 * 6.283185482025146484375;
    float _2237 = sin(_2235);
    float _2239 = _2217 * _2225;
    float _2241 = _2205 * _2225;
    float _2243 = _2229 * _2205;
    float _2245 = _2229 * _2199;
    float _2247 = _2229 * _2225;
    float _2249 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1807);
    float _2251 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1753);
    float _2253 = _2199 * _2225;
    float _2255 = _2209 * _2249;
    float _2257 = _2211 * _2251;
    float _2259 = fma(_2237, _2243, _2231);
    float _2261 = -_2233;
    float _2263 = fma(_2237, _2245, _2261);
    float _2265 = _2247 * _2255;
    float _2267 = -_2255;
    float _2269 = _2237 * _2267;
    float _2271 = -_2245;
    float _2273 = fma(_2237, _2233, _2271);
    float _2275 = _2239 * _2255;
    float _2277 = fma(_2259, _2257, _2265);
    float _2279 = fma(_2241, _2257, _2269);
    float _2281 = fma(_2237, _2231, _2243);
    float _2283 = fma(_2273, _2257, _2275);
    float _2285 = fma(_2263, _2221, _2277);
    float _2287 = fma(_2253, _2221, _2279);
    float _2289 = fma(_2281, _2221, _2283);
    float _2291 = _2285 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2293 = _2285 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2295 = _2285 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2297 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2291);
    float _2299 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2293);
    float _2301 = _702 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2303 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2295);
    float _2305 = fma(_2289, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2297);
    float _2307 = fma(_2289, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2299);
    float _2309 = fma(_2289, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2303);
    float _2311 = _1899 + _2305;
    float _2313 = _1893 + _2307;
    float _2315 = _1891 + _2309;
    float _2317 = fma(_2301, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2311);
    float _2319 = fma(_2301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2313);
    float _2321 = fma(_2301, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2315);
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2325 = _2317 + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2329 = _2319 + _2327;
    float _2331 = _2325 * _2325;
    float _2333 = fma(_2329, _2329, _2331);
    float _2335 = sqrt(_2333);
    bool _2337 = _2335 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2339 = _2295;
    float _2341 = _2315;
    float _2343 = _2321;
    float _2345 = 0.5;
    float _2347 = _2247;
    if (!_2337)
    {
        _2339 = _2319;
    }
    float _2349 = _2339;
    float _2351 = _2349;
    if (!_2337)
    {
        _2341 = _2317;
    }
    float _2353 = _2341;
    bool _2355 = !_2337;
    float _2357 = _2353;
    if (!_2355)
    {
        float _2359 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2363 = _2335 + _2361;
        float _2365 = rsqrt(_2333);
        float _2367 = _2363 * _2359;
        float _2369 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2371 = _2367 * 0.15915493667125701904296875;
        float _2373 = _2371 * 6.283185482025146484375;
        float _2375 = cos(_2373);
        float _2377 = _2371 * 6.283185482025146484375;
        float _2379 = sin(_2377);
        float _2381 = _2375 + (-1.0);
        float _2383 = fma(_2379, _2369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2385 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2387 = _2365 * _2383;
        float _2389 = fma(_2321, _2375, _2385);
        float _2391 = fma(_2329, _2387, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2393 = fma(_2325, _2387, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2343 = _2389;
        _2351 = _2391;
        _2357 = _2393;
    }
    float _2395 = _2343;
    float _2397 = _2351;
    float _2399 = _2357;
    float _2401 = -_2089;
    float _2403 = fma(_2401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2395);
    float _2405 = -_2091;
    float _2407 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2397);
    float _2409 = -_2113;
    float _2411 = fma(_2409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2399);
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2415 = _2403 + _2413;
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2419 = _2407 + _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2423 = _2411 + _2421;
    float _2425 = _2415 * _2415;
    float _2427 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2429 = fma(_2419, _2419, _2425);
    float _2431 = fma(_2423, _2423, _2429);
    float _2433 = rsqrt(_2431);
    float _2435 = sqrt(_2431);
    float _2437 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2439 = _2419 * _2437;
    float _2441 = _2423 * _2437;
    float _2443 = _2439 * _2439;
    float _2445 = _2441 * _2441;
    float _2447 = _2443 + _2445;
    float _2449 = sqrt(_2447);
    bool _2451 = _2449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2455 = _2449 + _2453;
    float _2457 = _2109;
    float _2459 = _2447;
    float _2461 = _2455;
    float _2463 = _2437;
    float _2465 = _2415;
    float _2467 = _2439;
    float _2469 = _2441;
    float _2471 = _2443;
    float _2473 = _2445;
    if (_2451)
    {
        float _2475 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2457 = _2475;
    }
    float _2477 = _2457;
    if (_2451)
    {
        float _2479 = rsqrt(_2447);
        _2459 = _2479;
    }
    float _2481 = _2459;
    if (_2451)
    {
        float _2483 = _2455 * _2477;
        _2461 = _2483;
    }
    float _2485 = _2461;
    float _2487 = precise::max(0.0, _2427);
    float _2489 = 0.0;
    float _2491 = _2487;
    if (_2451)
    {
        float _2493 = _2485 * 0.15915493667125701904296875;
        _2489 = _2493;
    }
    float _2495 = _2489;
    float _2497 = -_2437;
    float _2499 = -_2487;
    float _2501 = fma(_2415, _2497, _2499);
    float _2503 = as_type<float>(_2087);
    float _2505 = _2501;
    if (_2451)
    {
        float _2507 = _2495 * 6.283185482025146484375;
        float _2509 = sin(_2507);
        _2503 = _2509;
    }
    float _2511 = _2503;
    if (_2451)
    {
        float _2513 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2463 = _2513;
    }
    float _2515 = _2463;
    float _2517 = _2485;
    float _2519 = _2515;
    if (_2451)
    {
        float _2521 = _2495 * 6.283185482025146484375;
        float _2523 = cos(_2521);
        _2517 = _2523;
    }
    float _2525 = _2517;
    float _2527 = _2511;
    if (_2451)
    {
        float _2529 = fma(_2511, _2515, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2527 = _2529;
    }
    float _2531 = _2527;
    if (_2451)
    {
        float _2533 = _2481 * _2531;
        _2491 = _2533;
    }
    float _2535 = _2491;
    float _2537 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2451)
    {
        float _2539 = _2525 + (-1.0);
        _2465 = _2539;
    }
    float _2541 = _2465;
    if (_2451)
    {
        float _2543 = _2439 * _2535;
        _2467 = _2543;
    }
    float _2545 = _2467;
    if (_2451)
    {
        float _2547 = _2441 * _2535;
        _2469 = _2547;
    }
    float _2549 = _2469;
    float _2551 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2537);
    if (_2451)
    {
        float _2553 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2519 = _2553;
    }
    float _2555 = _2519;
    if (_2451)
    {
        float _2557 = _2545 * _2545;
        _2471 = _2557;
    }
    float _2559 = _2471;
    if (_2451)
    {
        float _2561 = _2549 * _2549;
        _2473 = _2561;
    }
    float _2563 = _2473;
    if (_2451)
    {
        float _2565 = fma(_2501, _2525, _2555);
        _2505 = _2565;
    }
    float _2567 = _2505;
    float _2569 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2571 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2551);
    float _2573 = fma(_2567, _2567, _2559);
    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2577 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2575);
    float _2579 = precise::clamp(_2577, 0.0, 1.0);
    float _2581 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2583 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2585 = _2573 + _2563;
    float _2587 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2569);
    float _2589 = _2403 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2591 = -_2579;
    float _2593 = _2591 + 1.0;
    float _2595 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2583);
    float _2597 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2587);
    float _2599 = rsqrt(_2585);
    float _2601 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2589);
    float _2603 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2595);
    float _2605 = _2597 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2607 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2601);
    float _2609 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2611 = abs(_2593);
    float _2613 = log2(_2611);
    float _2615 = _2607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2617 = -_2609;
    float _2619 = fma(_2617, _2581, 1.0);
    float _2621 = _2603 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2623 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2625 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2627 = _2599 * _2545;
    float _2629 = _2599 * _2567;
    float _2631 = _2571 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2633 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2623);
    float _2635 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2637 = _2599 * _2549;
    float _2639 = log2(_2619);
    float _2641 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2633);
    float _2643 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2645 = -_2635;
    float _2647 = fma(_2629, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2645);
    float _2649 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2625);
    float _2651 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2641);
    float _2653 = _2629 + 1.0;
    float _2655 = exp2(_2643);
    float _2657 = -_2637;
    float _2659 = fma(_2657, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2647);
    float _2661 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2663 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2649);
    float _2665 = fma(_2659, -0.5, 0.5);
    float _2667 = fma(_2659, 0.5, 0.5);
    float _2669 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2661);
    float _2671 = 1.0 / _2651;
    float _2673 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2663);
    float _2675 = fma(_2667, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2677 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2669);
    float _2679 = _2639 * 0.693147182464599609375;
    float _2681 = sqrt(_2665);
    float _2683 = -_2629;
    float _2685 = fma(_2655, _2653, _2683);
    float _2687 = fma(_2667, _2675, -0.212114393711090087890625);
    float _2689 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2677);
    float _2691 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2693 = fma(_2667, _2687, 1.570728778839111328125);
    float _2695 = _2673 * _2671;
    float _2697 = _2689 * _2671;
    float _2699 = fma(_2695, 0.5, 0.5);
    float _2701 = fma(_2697, -0.5, 0.5);
    float _2703 = _2681 * 0.636619746685028076171875;
    float3 _6839 = float3(_2699, _2701, _2691);
    float _2705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6839, float3(0.0), isnan(_6839)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6839, float3(0.0), isnan(_6839)), level(0.0)).x;
    float _2707 = -_2693;
    float _2709 = fma(_2703, _2707, 1.0);
    float _2711 = fma(_2685, 0.5, 0.5);
    float3 _6857 = float3(_2699, _2701, _2691);
    float4 _2713 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6857, float3(0.0), isnan(_6857)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6857, float3(0.0), isnan(_6857)), level(0.0)).xyzw;
    float _2715 = _2713.x;
    float _2717 = _2713.y;
    float _2719 = _2713.z;
    float _2721 = _2713.w;
    float2 _6873 = float2(_2709, _2711);
    float3 _2725 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6873, float2(0.0), isnan(_6873)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6873, float2(0.0), isnan(_6873)), level(0.0)).xyz;
    float _2727 = _2725.x;
    float _2729 = _2725.y;
    float _2731 = _2725.z;
    float _2733 = -_2089;
    float _2735 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1891);
    float _2737 = _1773 * 3.883221149444580078125;
    float _2739 = -_2091;
    float _2741 = fma(_2739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1893);
    float _2743 = -_2113;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1899);
    float _2747 = _2735 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2749 = _2737 * 0.15915493667125701904296875;
    float _2751 = _1805 * _1861;
    bool _2753 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2755 = isnan(0.5);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2761 = _2757 || _2759;
    float _2763 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2747);
    float _2765 = _1789 * 2.0;
    float _2767 = _2749 * 6.283185482025146484375;
    float _2769 = cos(_2767);
    float _2771 = -_1575;
    float _2773 = _2771 + _1775;
    float _2775 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2763);
    float _2777 = -_2765;
    float _2779 = fma(_2751, _2777, _2751);
    float _2781 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2783 = fma(_1721, _2773, _1575);
    float _2785 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2787 = _2735 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2789 = fma(_1789, 3.1415927410125732421875, _2779);
    float _2791 = _2749 * 6.283185482025146484375;
    float _2793 = sin(_2791);
    if (!_2761)
    {
        _2345 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2795 = _2345;
    float _2797 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2787);
    float _2799 = _2789 * 0.15915493667125701904296875;
    float _2801 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2783);
    out.m_63.x = _1603;
    out.m_63.y = _1601;
    out.m_63.z = _1611;
    out.m_63.w = _1557;
    float _2803 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2797);
    float _2805 = 1.0 / _2785;
    out.m_65.x = _642;
    out.m_65.y = _644;
    out.m_65.z = _648;
    out.m_65.w = _636;
    float _2807 = _2803 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_67.x = _1605;
    out.m_67.y = _1595;
    out.m_67.z = _1569;
    out.m_67.w = _1553;
    float _2809 = _2807 + _2785;
    float _2811 = _2799 * 6.283185482025146484375;
    float _2813 = sin(_2811);
    out.m_69.y = _2209;
    float _2815 = -_2801;
    float _2817 = _2237 * _2815;
    out.m_71.x = _2407;
    out.m_71.y = _2403;
    out.m_71.z = _2411;
    float _2819 = _2247 * _2801;
    float _2821 = _2809 * _2805;
    float _2823 = _2821 * 0.5;
    float _2825 = exp2(_2781);
    float _2827 = _2239 * _2801;
    float _2829 = _2823;
    float _2831 = _2795;
    float _2833 = _2805;
    if (_2761)
    {
        _2347 = 1.0;
    }
    float _2835 = _2347;
    float _2837 = _2835;
    if (!_2761)
    {
        float _2839 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2841 = fma(_2823, _2795, _2839);
        _2829 = _2841;
    }
    float _2843 = _2829;
    if (!_2761)
    {
        _2831 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2845 = _2831;
    float _2847 = -_1727;
    float _2849 = fma(_2813, _2769, _2847);
    float _2851 = -_1729;
    float _2853 = fma(_2813, _2793, _2851);
    float _2855 = _2843;
    if (!_2761)
    {
        float _2857 = 1.0 / _2843;
        _2855 = _2857;
    }
    float _2859 = _2855;
    if (!_2761)
    {
        float _2861 = -_2845;
        float _2863 = _2861 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2833 = _2863;
    }
    float _2865 = _2833;
    float _2867 = fma(_1721, _2849, _1727);
    float _2869 = fma(_1721, _2853, _1729);
    float _2871 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2867);
    float _2873 = fma(_1755, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2869);
    float _2875 = _2865;
    if (!_2761)
    {
        float _2877 = 1.0 / _2865;
        _2875 = _2877;
    }
    float _2879 = _2875;
    float _2881 = -_2825;
    float _2883 = _2881 + 1.0;
    float _2885 = fma(_2241, _2871, _2817);
    float _2887 = _2615 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2889 = fma(_2259, _2871, _2819);
    float _2891 = fma(_2273, _2871, _2827);
    float _2893 = fma(_2253, _2873, _2885);
    float _2895 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2887);
    float _2897 = fma(_2263, _2873, _2889);
    float _2899 = _2859;
    if (!_2761)
    {
        float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2903 = -_2845;
        float _2905 = fma(_2859, _2901, _2903);
        _2899 = _2905;
    }
    float _2907 = _2899;
    float _2909 = fma(_2281, _2873, _2891);
    float _2911 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2895);
    float _2913 = _2897 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2915 = _2897 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2917 = _2897 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2919 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2911);
    float _2921 = fma(_2893, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2913);
    float _2923 = fma(_2893, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2915);
    float _2925 = fma(_2893, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2917);
    float _2927 = _2907;
    if (!_2761)
    {
        float _2929 = _2907 * _2879;
        float _2931 = precise::clamp(_2929, 0.0, 1.0);
        _2927 = _2931;
    }
    float _2933 = _2927;
    float _2935 = fma(_2909, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2921);
    float _2937 = fma(_2909, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2923);
    float _2939 = fma(_2909, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2925);
    float _2941 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2761)
    {
        float _2943 = -_2933;
        float _2945 = _2943 + 1.0;
        _2837 = _2945;
    }
    float _2947 = _2837;
    float _2949 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2951 = _2919 + _2949;
    out.m_73.x = _2937;
    out.m_73.y = _2935;
    out.m_73.z = _2939;
    float _2953 = _2947 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2955 = _2947 > 0.0;
    bool _2957 = isnan(_2947);
    bool _2959 = _2955 || _2957;
    bool _2961 = isnan(0.0);
    bool _2963 = _2959 || _2961;
    float _2965 = _2651 + _2951;
    float _2967 = _371 * _2953;
    float _2969 = _2965 * 0.5;
    float _2971 = _2967 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2673;
    out.gl_Position.y = _2689;
    out.gl_Position.z = _2951;
    out.gl_Position.w = _2651;
    float _2973 = -_2941;
    float _2975 = _2973 + 1.0;
    out.m_75.z = _2969;
    out.m_75.w = _2651;
    out.m_47.x = _2971;
    float _2977 = _2941 * _2705;
    float _2979 = _2721 * _2977;
    float _2981 = _2721 * _2975;
    float _2983 = _2731 * _2977;
    float _2985 = fma(_2727, _2979, _2715);
    float _2987 = fma(_2729, _2979, _2717);
    float _2989 = fma(_2721, _2983, _2719);
    out.m_77.x = _2985;
    out.m_77.y = _2987;
    out.m_77.z = _2989;
    out.m_77.w = _2981;
    if (_2963)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2991 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2991;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

